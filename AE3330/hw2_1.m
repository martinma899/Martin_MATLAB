clc;clear

ve = 390;
vf = 190;
A = 0.5;
rho0 = 1.225;
rhoh = density(9700);
n = 0.55;

T0max = rho0*vf*A*ve
Tav = (rhoh/rho0)^n*T0max
deltat1 = 24000/Tav

c = 0.5/Tav

rhoh2 = density(9900)
Tav2 = (rhoh2/rho0)^n*T0max
deltat2 = 24000/Tav2

Tproduced = Tav2*deltat1