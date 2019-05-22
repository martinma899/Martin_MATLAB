clc;clear;close all

[x,y,t] = produceNonLinspaceSemiCircle2(1,pi/20,340,0.9);
l = numel(x);

threshold = 1e-17;

kappaarr = [];
dets = [];
for i = 2:(l-1)
  
  A = [x(i-1);y(i-1)];
  B = [x(i);y(i)];
  C = [x(i+1);y(i+1)];
  
  %[O,r,kappa] = solveForCurvature (A,B,C);
  determinant = abs(det([(B-A)';(C-B)']));
%  % method 1. Cut off. 
%   if abs(determinant)<threshold
%     kappa = 1;
%   end
%  % method 2. If things break down, search for near panels.
  
  Aind = i-1;
  Bind = i;
  Cind = i+1;
  while true
    if ~(abs(determinant)<=threshold)
      [O,r,kappa] = solveForCurvature (A,B,C);
      break
    end
    disp(i)
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

  kappaarr = [kappaarr;kappa];
  dets = [dets;abs(determinant)];
end

%[x,y,r] = idealEllipseCurvature (1001);
kappaIdeal = ones(numel(kappaarr),1);

variation1 = 5e-10;
xwindow = [-variation1 variation1];
%xwindow = [-1 1]


subplot(3,1,1);
hold on
plot(x(2:end-1),kappaIdeal,'k-o');
plot(x(2:end-1),kappaarr,'r.-');
variation2 = 1e-3;
axis([xwindow 1-variation2 1+variation2])


ylabel('kappa')

subplot(3,1,2)
plot(x(2:end-1),dets,'m.-');
axis([xwindow 0 2*threshold])
str = sprintf('determinant of matrix A \nof linear system solved');
ylabel(str)

subplot(3,1,3)
plot(x(2:end-1),y(2:end-1),'b.-');
axis([xwindow 1-1e-15 1])

ylabel('geometry of the ellipse')
xlabel('x')
















