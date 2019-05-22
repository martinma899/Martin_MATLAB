clc;clear

rhoinf = 1.225;
Pinf = 101000;
T = 273+15
P0 = 107000;
r = 1.4;
v = 130;
R = 286.9;

M = sqrt(((P0/Pinf)^((r-1)/r)-1)*2/(r-1))
vinf1 = M*sqrt(r*R*T)

P = P0-rhoinf*v^2/2

vinf = sqrt((P0-Pinf)*2/rhoinf)

Cp = (P-Pinf)/(0.5*rhoinf*vinf^2)
Cp = 1-(v/vinf)^2

vinfguess = v/sqrt(1--0.73)