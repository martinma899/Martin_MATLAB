clc;clear;close all

res = 100001;

x = linspace(-pi,pi,res);
res = numel(x);

y = zeros(1,res)+1;

plot(x,y,'b.-')
hold on

a0 = 1+pi/2;
terms = 5000;
alist = zeros(0,terms);
blist = zeros(0,terms);

yest = zeros(1,res);
%yest = yest+a0/2;

for n = 1:terms
  disp(n)
  %an = (-1+(-1)^n)/(pi*n^2);
  bn = 2/pi*(1-(-1)^n)/n;
  %alist(n) = an;
  blist(n) = bn;
  yest = yest+...
    +bn*sin(n*x);
    %+an*cos(n*x);
end

plot(x,yest,'r.-');

%ys = smooth(x,yest,50,'lowess');
% plot(x,ys,'g.-');