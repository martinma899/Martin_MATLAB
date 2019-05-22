clear;clc
r = 1.2;
d = 3;
As = pi/4*d^2;
Ae = As*50;
Me = 0.011841418170881;
T0 = 5400;
P0 = 1500;

Pe = P0/(1+(r-1)/2*Me^2)^(r/(r-1))

mwslug = 0.31081;
Runi = 1545.349;
Raircalc = Runi/mwslug;
R = Raircalc*12

Ts = T0/(1+(r-1)/2)
us = sqrt(r*R*Ts)
rho0 = P0/(R*T0)
rhos = rho0/(1+(r-1)/2)^(1/(r-1))
mdotmax = rhos*us*As

Me1 = 4.39582721294655
Te1 = T0/(1+(r-1)/2*Me1^2)
Pe1 = P0/(1+(r-1)/2*Me1^2)^(r/(r-1))
P02 = P0*p0ratio(Me1,r)
Me2 = nshockM2(Me1,r)

Te2 = T0/(1+(r-1)/2*Me2^2)
Pe2 = P02/(1+(r-1)/2*Me2^2)^(r/(r-1))

Pe2alt = Pe1*(2*r/(r+1)*Me1^2-(r-1)/(r+1))