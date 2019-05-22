clc;clear

k1 = 4;k2 = 20;b1 = 1;b2 = 10;

A = [k1/b1 -(k1+k2)/b2;k1/b1 -k1/b1];
B = [0;1/b1];

t = linspace(0,10,101);
x0 = [0;0];
xarr = [];
for i = 1:length(t)
x = exp(A*t(i))*x0+inv(A)*(exp(A*t(i))-eye(2))*B;
xarr = [xarr x];
end

plot(t,xarr(1,:))

A = [1 0 0 0 1 0;1 1 0 1 0 0;1 1 1 0 0 0 ;0 1 1 0 0 0;0 0 1 0 0 1]

rref(A)