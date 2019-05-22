clc;clear;close all

arrayout = readInputFile('RAE2822.geom');

upperSurf = arrayout(1:65,:);
lowerSurf = arrayout(65:end,:);
lowerSurf = lowerSurf(end:-1:1,:);

x = upperSurf(:,1);
yupper = upperSurf(:,2);
ylower = lowerSurf(:,2);
thk = yupper-ylower;
camber = (yupper+ylower)/2;

% log(x+1) 

A = [sqrt(x) x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];
Coeffthk = (A'*A)^-1*(A'*thk)
thkapprox = A*Coeffthk;

A = [x x.^2 x.^3 x.^4 x.^5 x.^6 x.^7];
Coeffcamber = (A'*A)^-1*(A'*camber)
camberapprox = A*Coeffcamber;

upperSurfApprox = camberapprox+thkapprox/2;
lowerSurfApprox = camberapprox-thkapprox/2;


figure(1)
hold on
plot(x,yupper,'b.-')
plot(x,ylower,'b.-')
plot(x,camber,'m.-')
plot(x,thk,'g.-')
plot(x,camberapprox,'r.-')
plot(x,thkapprox,'c.-')

plot(x,upperSurfApprox,'r.-')
plot(x,lowerSurfApprox,'r.-')

 
figure(2)
hold on
plot(x,camber-camberapprox,'r.-')
plot(x,thk-thkapprox,'b.-')
%plot(x,(yupper-upperSurfApprox)./yupper,'r.-')
%plot(x,(ylower-lowerSurfApprox)./ylower,'b.-')

% write airfoil to file
xfine = linspace(0,1,2001)';
Afine = [sqrt(xfine) xfine.^2 xfine.^3 xfine.^4 ...
  xfine.^5 xfine.^6 xfine.^7];
thkfine = Afine*Coeffthk;
Afine = [xfine xfine.^2 xfine.^3 xfine.^4 xfine.^5 ...
  xfine.^6 xfine.^7];
camberfine = Afine*Coeffcamber;

yfineupper = camberfine+thkfine/2;
yfinelower = camberfine-thkfine/2;

coords = [[xfine;xfine(end:-1:1)]...
          [yfineupper;yfinelower(end:-1:1)]];

% fid2 = fopen('RAE2822_4001.geom','w');
% for i = 1:size(coords,1)
%   fprintf(fid2,'%1.5f %1.17f\n',coords(i,1),coords(i,2));
% end























