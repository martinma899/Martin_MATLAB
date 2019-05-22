clc;clear;close all

coords = produceNonLinspaceEllipse2(1,1,2*pi/20,1000);
%coords = produceNonLinspaceEllipse(0.5,0.25,100);


[length,~] = size(coords);

kappaarr = [];
dets = [];

for i = 1:length
  
  B = coords(i,:)';
  if i == length
    C = coords(2,:)';
  else
    C = coords(i+1,:)';
  end
  if i == 1
    A = coords(length-1,:)';
  else
    A = coords(i-1,:)';
  end
  
  [O,r,kappa,determinant] = solveForCurvature (A,B,C);
  threshold = 0;
  %disp(determinant)
  if abs(determinant)<threshold
    kappa = 1;
  end
  
  kappaarr = [kappaarr;kappa];
  dets = [dets;determinant];
end

%[x,y,r] = idealEllipseCurvature (1001);
kappaIdeal = ones(numel(kappaarr),1);

variation1 = 4e-9;
xwindow = [1-variation1 1];
%xwindow = [-1 1]


subplot(3,1,1);
hold on
plot(coords(:,1),kappaIdeal,'k-o');
plot(coords(:,1),kappaarr,'r.-');
variation2 = 1e-3;
axis([xwindow 1-variation2 1+variation2])


ylabel('kappa')

subplot(3,1,2)
plot(coords(:,1),dets,'m.-');
axis([xwindow 0 1e-16])

str = sprintf('determinant of matrix A \nof linear system solved');
ylabel(str)

subplot(3,1,3)
plot(coords(:,1),coords(:,2),'b.-');
axis([xwindow -0.4e-4 0])

ylabel('geometry of the ellipse')
xlabel('x')
















