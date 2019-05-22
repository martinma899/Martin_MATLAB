clc;clear

v1 = 3;
T1 = 273.15+20;
v2 = 10;
T2 = 273.15+80;
A = 20/10000;
R = 286.9;
P1 = 101000;
Cp = 1000;

rho1 = P1/(R*T1)
mdot = v1*rho1*A

Qdot = mdot*((Cp*T2+v2^2/2)-(Cp*T1+v1^2/2))