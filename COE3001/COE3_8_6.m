clc;clear

l1 = 225e-3;
l2 = 450e-3;
d1 = 20e-3;
d2 = 25e-3;
Tallow = 43e6;
phimax = 1.85*pi/180;
G = 28e9;

Ipac = pi/32*d1^4
Ipbc = pi/32*d2^4
TaoverTb = l2/l1*Ipac/Ipbc

T0 = (1+TaoverTb)*Tallow

Tbmax = phimax*G*Ipbc/l2
T0max = Tbmax*(1+TaoverTb)