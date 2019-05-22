clc;clear

gamma = 5/3;
M = 0.5;
T0 = 1000;
A = 0.16;
P0 = 1e6;

R = 2080;

rho0 = P0/(R*T0)
rho = rho0/((1+(gamma-1)/2*M^2)^(1/(gamma-1)))
T = T0/(1+(gamma-1)/2*M^2)
a = sqrt(gamma*R*T)
u = M*a

mdot = rho*u*A