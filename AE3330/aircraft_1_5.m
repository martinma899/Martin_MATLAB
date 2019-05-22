clc;clear

AE = 21;
P = 22800;
T = 217;
b = 36;
AR = 15;
L = 3100;
eff = 0.98;
R = 287.05;

S = b^2/AR
D = L/AE

Cd = 0.5*pi*eff*AR/AE^2

rho = P/(R*T)

v = sqrt(D/(0.5*rho*S*Cd))