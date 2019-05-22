clc;clear;close all

arrayout = readInputFile('RAE2822.geom');

x = arrayout(:,1);
y = arrayout(:,2);

xalt1 = linspace(0,1,1001);
xalt2 = linspace(1,0,1001);
xalt2(1) = [];
xalt = [xalt1 xalt2];

yApprox = interp1(x,y,xalt,'spline');

figure(1)
hold on
plot(x,y,'b.-')
plot(xalt,yApprox,'r.-')
axis equal

%  figure(2)
%  hold on
%  plot(x,yupper-yupperApprox,'r.-')
%  plot(x,ylower-ylowerApprox,'b.-')

% fid = fopen('RAE2822_2001.geom','w');
% for i = 1:length(xalt)
%   fprintf(fid,'%1.3f %1.16e\n',xalt(i),yupperApprox(i));
% end
% for i = length(xalt)-1:-1:1
%   fprintf(fid,'%1.3f %1.16e\n',xalt(i),ylowerApprox(i));
% end
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  