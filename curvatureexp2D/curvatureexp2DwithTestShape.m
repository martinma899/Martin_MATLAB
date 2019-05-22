clc;clear;close all

[x,y,t] = produceNonLinspaceTestShape(1,pi/20,300,0.9);
%[x,y,t] = produceNonLinspaceTestLine(1,pi/20,100,0.9);
l = numel(x);

threshold = 1e-16;
threshold2 = 1e-10;

kappaarr = [];
dets = [];
sinthetas = [];
for i = 2:(l-1)
  Aind = i-1;
  Bind = i;
  Cind = i+1;
  A = [x(Aind);y(Aind)];
  B = [x(Bind);y(Bind)];
  C = [x(Cind);y(Cind)];
  %  % method 2. If things break down, search for near panels.
  determinant = abs(det([(B-A)';(C-B)']));
  n = 0;
  while true
    if ~(abs(determinant)<=threshold)
      [O,r,kappa] = solveForCurvature (A,B,C);
      break
    end
    panelDistProd = norm(B-A)*norm(C-B);
    sintheta = determinant/panelDistProd;
    if sintheta<=threshold2
      kappa = 0;
      break
    end
    n = n+1;
    Aind = Aind-1;
    if ~(Aind<1||Aind>l)
      A = [x(Aind);y(Aind)];
    end
    Cind = Cind+1;
    if ~(Cind<1||Cind>l)
      C = [x(Cind);y(Cind)];
    end
    determinant = abs(det([(B-A)';(C-B)']));
  end
  fprintf('Node %d. Searched %d neighbor panels.\n',i,n);
  kappaarr = [kappaarr;kappa];
  dets = [dets;determinant];
end

%[x,y,r] = idealEllipseCurvature (1001);
kappaIdeal = ones(numel(kappaarr),1);

variation1 = 1e-7;
xwindow = [-variation1 variation1];
%xwindow = [-1 1]


subplot(3,1,1);
hold on
plot(x(2:end-1),kappaarr,'r.-');
variation2 = 1e-3;
xlabel('x')
ylabel('kappa')
axis([xwindow 0 1])

subplot(3,1,2)
plot(x(2:end-1),y(2:end-1),'b.-');
%axis equal
axis([xwindow 1-1e-15 1])
ylabel('geometry')
xlabel('x')

subplot(3,1,3)
semilogy(x(2:end-1),dets,'m.-');
axis([xwindow  1e-20 1])
xlabel('x')
str = sprintf('determinant of matrix A \nof linear system solved');
ylabel(str)


















