clc;clear

m = 1;
k = 1;
b = 1;

x0 = 0;
xdot0 = 5;

if k*m-b^2/4<0
  tf = 10;
  disp('system overdamped')
elseif k*m-b^2/4 == 0
   tf = 10;
   disp('system critically damped')
else
  omega = sqrt(k/m-(b/(2*m))^2);
  T = 2*pi/omega
  nT = 3;
  tf = nT*T;
  disp('system underdamped')
end

xvec0 = [x0;xdot0];

[tlist,xlist] = ode45(@(t,x) SMD(t,x,m,k,b),[0 tf],xvec0);

plot (tlist, xlist(:,1),'b.-')
% plot ([0 1:nT]*T,[0 1:nT]*0,'rd')
% hold off


