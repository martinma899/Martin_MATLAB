clc;clear

l = 4;
h = 300e-3;
b = 200e-3;
I = b*h^3/12;
y = h/2;
sigmaxmax = 120e6;

[~,q0] = recsolve (0,100000000)

Mmax = -(4/3*l).^(3/2)/(6*l).*q0+2/3.*sqrt(4/3*l).*q0

xmax = sqrt(4/3*l)

sigmax = Mmax*y/I