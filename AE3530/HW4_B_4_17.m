clc;clear;

syms s x0 v0

m = 10;
b1 = 50;
b2 = 70;
k1 = 400;
k2 = 600;
X = (s*x0+(b1+b2)*x0+v0)/(m*s^2+(b1+b2)*s+(k1+k2));

x = ilaplace(X)


x0 = 0.1;
v0 = 0.5;

tlist = linspace(0,5,101);
xlist = tlist*0;

for i=1:101 
  t = tlist(i);
  xlist(i) = eval(x);
end

plot(tlist,xlist,'b.-')

