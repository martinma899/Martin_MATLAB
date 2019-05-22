clc;clear

d = 4.75;
l = 52*12;
ymax = d/2;
rho = l*4/(2*pi)
kappa = 1/rho
epsilonxmax = -kappa*ymax

% problem 2

epsilonxmax = 6.1e-3
dmax = epsilonxmax*2/kappa

% problem 3
d = 4.75;
lmin = pi*d/(4*epsilonxmax)
lmin/12