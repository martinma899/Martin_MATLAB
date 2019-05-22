clc;clear

Re = 6370e3;
mew = 0.3986e15;
h = 800000;

r = h+Re
v = sqrt(mew/r)
deltai = 1
deltav = 2*v*sind(deltai/2)