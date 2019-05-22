clc;clear

P0max = 200e3;
ita = 0.85;
h = 3500;
rho0 = density(0)
rhoh = density(h)
n = 0.6;

Pav = (rhoh/rho0)^n*P0max*ita
T = 3500;
vf = Pav/T

deltat = 0.5;
P2 = Pav*deltat
vf2 = 0.5*vf
T2 = P2/vf2