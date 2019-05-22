clc;clear

m = 0.1;
x0 = 1;
v0 = 0;
k = 4;
b = 0.4;

syms X s
X = (m*s*x0+m*v0+b*x0)/(m*s^2+b*s+k);

x = ilaplace(X);

tlist = linspace(0,2.5,1001);
xlist = zeros(1,1001);

for i = 1:1001
  t = tlist(i);
  xlist(i) = eval(x);
end

hold off
plot(tlist,xlist,'b.-')
grid on