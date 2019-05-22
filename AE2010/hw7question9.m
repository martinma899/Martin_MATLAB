clear;clc
[M,~] = recsolve(0,1)
A = 30e-4;
Astar = 15e-4;
gamma = 1.4;
P = 101000;
R = 286.9;
T0 = 500;
P0 = P*(1+(gamma-1)/2*M^2)^(gamma/(gamma-1))


P0 = 200000;
rho0 = P0/(R*T0)
Ts = T0/(1+(gamma-1)/2)
us = sqrt(gamma*R*Ts)
rhos = rho0/(1+(gamma-1)/2)^(1/(gamma-1))
mdot = rhos*us*Astar