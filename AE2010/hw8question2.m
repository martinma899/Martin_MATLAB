clc;clear

Ps = 26500;
Ts = 223.3;
P0 = 101000;
T0 = 293.15;
V = 100;
d = 0.02;
r = 1.4;
R = 287;
As = d^2/4*pi

ratio1 = P0/2/Ps
ratio2 = (1+(r-1)/2)^(r/(r-1))

as = sqrt(r*R*Ts)
rhos = Ps/(R*Ts)

mdot = rhos*as*As
t = P0*V/(2*mdot*R*T0)