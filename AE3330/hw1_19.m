clc;clear

Re = 6370e3;
mew = 0.3986e15;
h = 420e3;
hd = 50e3;

R = h+Re
ra = h+Re
rp = hd+Re
a = (ra+rp)/2
e = (ra-rp)/(ra+rp)
vf = sqrt(mew*(1-e)/(a*(1+e)))
vi = sqrt(mew/R)

deltav = abs(vf-vi)

g0 = 9.81;
mi = 100000;
Isp = 420;

mfuel = mi*(1-exp(-deltav/(g0*Isp))) 