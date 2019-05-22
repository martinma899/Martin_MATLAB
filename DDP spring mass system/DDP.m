clc;clear;close all
grid on
% dynamical system parameters
F = 10; % nominal constant u
m = 200;
k = 10;
b = 10;

% initial conditions
x0 = [0;0];

% final time
tf = 20;

% dimensions of x and u
xdim = 2;
udim = 1;

% final target state
x_target = [1;0];

% cost function quadratic form matrices
PHI = [10000000 0;0 10000000];
Lmat_x = [0 0;0 1000];
Lmat_u = 0.1;

% scaling factor of deltau each iteration
alpha = 1;

% number of DDP iterations
numIter = 200;

% set ode solver tolerances
opts = odeset('RelTol',1e-4,'AbsTol',1e-4);

% use ODE45 to generate nominal trajectory 
[tlist,xbar] = ode45(@(t,x) finit(t,x,F,m,k,b),[0 tf],x0,opts);
tlist = tlist';
xbar = xbar';

subplot(2,2,2)
plot(xbar(1,:),xbar(2,:),'k.-');
hold on
xlabel('x')
ylabel('v')

% count number of steps (not including final state) from ODE45 result
nsteps = numel(tlist)-1;

% we know initial nominal u, which is constant
ubar = ones(1,nsteps)*F; 

% make a dt list for later computation
dtlist = diff(tlist);

% initialize deltaulist
deltaulist = nan(udim,nsteps);

% initialize fx and fu lists
fxbar = nan(xdim,xdim,nsteps);
fubar = nan(xdim,udim,nsteps);

% assign fxbar and fubar
for i = 1:nsteps
  fxbar(:,:,i) = [0 1;-k/m -b/m];
  fubar(:,:,i) = [0;1/m];
end

% initialize A and B lists
A = nan(xdim,xdim,nsteps);
B = nan(xdim,udim,nsteps);

% initialize cost function and derivatives 
Lbar = nan(1,nsteps);
Lxbar = nan(xdim,nsteps);
Lubar = nan(udim,nsteps);
Lxxbar = nan(xdim,xdim,nsteps);
Luubar = nan(udim,udim,nsteps);
Luxbar = zeros(udim,xdim,nsteps);
Lxubar = zeros(xdim,udim,nsteps);

% initialize Q and derivatives
Qbar = nan(1,nsteps);
Qxbar = nan(xdim,nsteps);
Qubar = nan(udim,nsteps);
Qxxbar = nan(xdim,xdim,nsteps);
Quubar = nan(udim,udim,nsteps);
Quxbar = nan(udim,xdim,nsteps);
Qxubar = nan(xdim,udim,nsteps);

% initialize value function and derivatives
Vbar = nan(1,nsteps+1);
Vxbar = nan(xdim,nsteps+1);
Vxxbar = nan(xdim,xdim,nsteps+1);

% initialize L log and Phibar log
Llog=[]; Phibarlog=[];

for i = 1:numIter
  
  % compute running cost and derivatives for nominal trajectory
  for k = 1:nsteps
    Lbar(k) = xbar(:,k)'*Lmat_x*xbar(:,k)+ubar(:,k)*Lmat_u*ubar(:,k);
    Lxbar(:,k) = 2*Lmat_x*xbar(:,k);
    Lubar(:,k) = 2*Lmat_u*ubar(:,k);
    Lxxbar(:,:,k) = 2*Lmat_x;
    Luubar(:,:,k) = 2*Lmat_u;
  end
  
  Phibar = (xbar(:,end)-x_target)'*PHI*(xbar(:,end)-x_target);
  Phixbar = 2*PHI*(xbar(:,end)-x_target);
  Phixxbar = 2*PHI;
  
  L = dot(Lbar,dtlist);

  Cost = L+Phibar;
  
  disp([i L Phibar Cost])
  
  Llog = [Llog;L];
  Phibarlog = [Phibarlog;Phibar];
  
%   if Phibar<=5
%     break;
%   end
  
  subplot(2,2,1)
  hold on
  plot(tlist(1:end-1),Lbar,'Marker','.','Color',[1-i/numIter,0,0]);
  
  % first, terminal value functions and derivatives are terminal cost and
  % derivatives. 
  Vbar(:,end) = Phibar;
  Vxbar(:,end) = Phixbar;
  Vxxbar(:,:,end) = Phixxbar;
  
  % compute quantities and back propagage V and Q. 
  % first compute A and B at k
  % then compute Q and derivatives at k
  % then find V at k
  
  for k = nsteps:-1:1
    A(:,:,k) = eye(xdim)+fxbar(:,:,k)*dtlist(k);
    B(:,:,k) = fubar(:,:,k)*dtlist(k);
    
    Qbar(k) = dtlist(k)*Lbar(k)+Vbar(k+1);
    Qxbar(:,k) = dtlist(k)*Lxbar(:,k)+A(:,:,k)'*Vxbar(:,k+1);
    Qubar(:,k) = dtlist(k)*Lubar(:,k)+B(:,:,k)'*Vxbar(:,k+1);
    Qxxbar(:,:,k) = dtlist(k)*Lxxbar(:,:,k)+A(:,:,k)'*Vxxbar(:,:,k+1)*A(:,:,k);
    Quubar(:,:,k) = dtlist(k)*Luubar(:,:,k)+B(:,:,k)'*Vxxbar(:,:,k+1)*B(:,:,k);
    Quxbar(:,:,k) = dtlist(k)*Luxbar(:,:,k)+B(:,:,k)'*Vxxbar(:,:,k+1)*A(:,:,k);
    Qxubar(:,:,k) = dtlist(k)*Lxubar(:,:,k)+A(:,:,k)'*Vxxbar(:,:,k+1)*B(:,:,k);

    Vbar(:,k) = Qbar(k)-1/2*Qubar(:,k)'*inv(Quubar(:,:,k))*Qubar(:,k);
    Vxbar(:,k) = Qxbar(:,k)-Qxubar(:,:,k)*inv(Quubar(:,:,k))*Qubar(:,k);
    Vxxbar(:,:,k) = Qxxbar(:,:,k)-Qxubar(:,:,k)*inv(Quubar(:,:,k))*Quxbar(:,:,k);
  end
  
  % use iterative forward propagation method to find next trajectory
  deltax_k = zeros(xdim,1);
  deltax_kplus1 = zeros(xdim,1);
  for k = 1:nsteps
    deltau_k = -inv(Quubar(:,:,k))*(Qubar(:,k)+Quxbar(:,:,k)*deltax_k);
    deltaulist(:,k) = deltau_k;
    deltax_kplus1 = A(:,:,k)*deltax_k+B(:,:,k)*deltau_k;
    xbar(:,k+1) = xbar(:,k+1)+deltax_kplus1;
    deltax_k = deltax_kplus1;
  end
  
  % add a scaled version of deltau to u vector
  ubar = ubar+deltaulist*alpha;
  
%   figure(2)
%   hold on
%   plot(xbar(1,:),xbar(2,:),'b.-');
  
  % make a copy of old tlist
  tlistold = tlist;
  
  % use ODE45 to generate new nominal trajectory 
  [tlist,xbar] = ode45(@(t,x) f(t,x,ubar,tlist(1:end-1),m,k,b),[0 tf],x0,opts);
  tlist = tlist';
  xbar = xbar';
  
  % plot(xbar(1,:),xbar(2,:),'r.-');
  
  % initialize everything again because we have a new nsteps
  
  % count number of steps (not including final state) from ODE45 result
  nsteps = numel(tlist)-1;
  
  % spline interploate ubar to new t's
  ubar = interp1(tlistold(1:end-1),ubar,tlist(1:end-1),'spline'); 
  
  % make a dt list for later computation
  dtlist = diff(tlist);
  
  % initialize deltaulist
  deltaulist = nan(udim,nsteps);
  
  % initialize fx and fu lists
  fxbar = nan(xdim,xdim,nsteps);
  fubar = nan(xdim,udim,nsteps);
  
  % assign fxbar and fubar
  for j = 1:nsteps
    fxbar(:,:,j) = [0 1;-k/m,-b/m];
    fubar(:,:,j) = [0;1/m];
  end
  
  % initialize A and B lists
  A = nan(xdim,xdim,nsteps);
  B = nan(xdim,udim,nsteps);
  
  % initialize cost function and derivatives
  Lbar = nan(1,nsteps);
  Lxbar = nan(xdim,nsteps);
  Lubar = nan(udim,nsteps);
  Lxxbar = nan(xdim,xdim,nsteps);
  Luubar = nan(udim,udim,nsteps);
  Luxbar = zeros(udim,xdim,nsteps);
  Lxubar = zeros(xdim,udim,nsteps);
  
  % initialize Q and derivatives
  Qbar = nan(1,nsteps);
  Qxbar = nan(xdim,nsteps);
  Qubar = nan(udim,nsteps);
  Qxxbar = nan(xdim,xdim,nsteps);
  Quubar = nan(udim,udim,nsteps);
  Quxbar = nan(udim,xdim,nsteps);
  Qxubar = nan(xdim,udim,nsteps);
  
  % initialize value function and derivatives
  Vbar = nan(1,nsteps+1);
  Vxbar = nan(xdim,nsteps+1);
  Vxxbar = nan(xdim,xdim,nsteps+1);
  
  % plot trajectory
  subplot(2,2,2),grid on
  plot(xbar(1,:),xbar(2,:),'Marker','.','Color',(1-i/numIter)*[1,0,1]);
  
  % plot u
  subplot(2,2,3)
  hold on,grid on
  plot(tlist(1:end-1),ubar,'Marker','.','Color',(1-i/numIter)*[0,0,1])
  xlabel('time')
  ylabel('u')
  
end

subplot(2,2,1)
grid on
xlabel('time')
ylabel('running cost')

subplot(2,2,2)
plot(x_target(1),x_target(2),'bd');













