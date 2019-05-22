clc;clear

g = 9.8;
r = 0.6;
P1 = 101000;
rho = 1.23;
v1 = 10;
v2 = 20;

P01 = P1+rho*v1^2/2
P2 = P1+rho*v1^2/2-rho*v2^2/2

P02 = P01- rho*g*r
P2alt = P02-rho*v2^2/2

-P2alt+P2