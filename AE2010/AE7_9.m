clear;clc

gamma = 1.4;
R = 286.5;
Cp = R*gamma/(gamma-1)
Patm = 101325;

Pinf = 0.61*Patm;
Pair = 0.3*Patm;
rhoinf = 0.819;
rhoair = (Pair/Pinf)^(1/gamma)*rhoinf
Tinf = Pinf/(R*rhoinf)
Tair = Pair/(R*rhoair)
vinf = 300;

P0 = Pinf+0.5*rhoinf*vinf^2
T0 = (P0/Pinf)^((gamma-1)/gamma)*Tinf
vair = sqrt(Cp*(T0-Tair)*2)

vairincorrect = sqrt((0.5*vinf^2+1/rhoinf*Pinf-1/rhoair*Pair)*2)

percenterror = (vair-vairincorrect)/vair

Mair = vair/sqrt(gamma*R*Tair)
Mairalt = sqrt(((P0/Pair)^((gamma-1)/gamma)-1)*(2/(gamma-1)))

