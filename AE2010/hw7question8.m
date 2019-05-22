clc;clear

A = 3e-2^2*pi/4;
gamma = 1.4;
P0 = 101300;
T0 = 288.2;
rho0 = 1.225;
R = 286.9;
P = 60e3
rho = (P/P0)^(1/gamma)*rho0
T = (P/P0)^((gamma-1)/gamma)*T0
M = sqrt(((P0/P)^((gamma-1)/gamma)-1)*2/(gamma-1))
mdot = rho*M*sqrt(gamma*R*T)*A