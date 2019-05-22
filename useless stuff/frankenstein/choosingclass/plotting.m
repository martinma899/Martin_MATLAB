% clear;clc;close all;
% 
% x = 1:8;
% y = 2:2:16;
% question = [2.5 3.1];
% newvec = interp1(x,y,question)
% 
% plot(x,y,'bd');
% hold
% plot(question,newvec,'rd')
% hold
% 
% y = x.^3;
% question2 = linspace(8,11,100);
% newvec2 = spline(x,y,question2)
% plot(x,y,'bd');
% hold
% plot(question2,newvec2,'b');
% hold
% 
% polyfit!!!!!!!
% polyval
% [numdata,~,~] = xlsread('testdata.xlsx');
% 
% mcvalue = numdata(:,2);
% freespeed = numdata(:,1);
% 
% zeroones = freespeed == 0;
% mcvalue(zeroones) = [];
% freespeed(zeroones) = [];
% 
% plot(freespeed,mcvalue,'b.')
% hold
% mypoly = polyfit(freespeed,mcvalue,5);
% fittedcurve = polyval(mypoly,linspace(0,113,1000));
% fittedcurve2 = polyval(mypoly,0:113);
% 
% plot(linspace(0,113,1000),fittedcurve,'r');
% plot(0:113,fittedcurve2,'rd');
% hold
% 
% trapz
% 
% x = linspace(-10,10,1000);
% poly = [1 0 0 -5];
% y = polyval(poly,x);
% area = trapz(x,y)
% 
% x = 1:5;
% y = x.^2;
% 
% derivpoly = polyfit(x(1:end-1),diff(y),3)

% fert = [10 4 6 3 8 2 1];
% yield = [50 21 30 16 43 10 5];
% 
% [fert,index] = sort(fert);
% yield = yield(index);
% 
% figure(1)
% plot(fert,yield,'bd')
% hold
% deriv = diff(yield)./diff(fert)
% 
% [biggest, bigplace] = max(deriv)
% 
% poly = polyfit(fert,yield,3)
% 
% ferttesting = linspace(fert(1),fert(end),100);
% 
% yieldtesting = polyval(poly,ferttesting)
% 
% plot(ferttesting,yieldtesting,'r')
% hold

% vector multiplication

% [1 2 3 4 5]'*[1 2 3 4 5]

x = 1:100000;
y = (1./x);
series = cumsum(y);
plot(x,series,'b.')

































