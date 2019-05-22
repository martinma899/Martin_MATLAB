clc;clear

Re = 6370e3;
mew = 0.3986e15;
h1 = 500000;
h2 = 35786000;
mi = 5000;
Isp = 400;
g = 9.81;

hp = 400000;
ha = 900000;

r1 = h1+Re
r2 = h2+Re
v1 = sqrt(mew/r1)
v2 = sqrt(mew/r2)

a = (r1+r2)/2
vp = sqrt(mew*(2/r1-1/a))
va = sqrt(mew*(2/r2-1/a))

dv1 = abs(v1-vp)
dv2 = abs(v2-va)

mfuel1 = mi*(1-exp(-dv1/(Isp*g)))
mfuel2 = (mi-mfuel1)*(1-exp(-dv2/(Isp*g)))

mfuel = mfuel1+mfuel2