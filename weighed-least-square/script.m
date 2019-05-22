clc;clear;close all

x = linspace(-pi/2,pi/2,101)';
y = sin(x)+rand(101,1)*0.01;

plot(x,y,'b.-')

% interpolate this regularly

A = [x ones(101,1)];
coeffs1 = (A'*A)\(A'*y);

y1 = A*coeffs1;

hold on
plot(x,y1,'r.-')

% create some weights

wvec = exp(-x.^2*10);
W = diag(sqrt(wvec));

A2 = W*A;
yw = W*y;
coeffs2 = (A2'*A2)\(A2'*yw);

y2 = A*coeffs2;
plot(x,y2,'m.-')