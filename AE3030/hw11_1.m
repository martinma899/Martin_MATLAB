clc;clear

vinf = 700
Pinf = 1 % atm
Tinf = 519
R = 1716
r = 1.4

ainf = sqrt(r*R*Tinf)
Minf = vinf/ainf

x = 0.2
y = 0.2

lambda = sqrt(1-Minf^2)

u = vinf+2*pi*70*cos(2*pi*x)/lambda*exp(-2*pi*y*lambda)
v = -2*pi*70*sin(2*pi*x)*exp(-2*pi*y*lambda)

vel = sqrt(u^2+v^2)

T0 = Tinf*(1+(r-1)/2*Minf^2)
a0 = sqrt(r*R*T0)

aloc = sqrt(a0^2-(r-1)/2*vel^2)

Mloc = vel/aloc

T = T0/(1+(r-1)/2*Mloc^2)

P = Pinf*((1+(r-1)/2*Minf^2)/(1+(r-1)/2*Mloc^2))^(r/(r-1))