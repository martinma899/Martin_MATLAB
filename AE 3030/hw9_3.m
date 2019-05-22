clc;clear

c = 0.127;
Me = 4;
Pr = 0.71;
rrec = sqrt(Pr)
r = 1.4
R = 286.9
Te = 288.15
Pe = 101300
uinf = Me*sqrt(r*R*Te)

TawoverTe = 1+rrec*(r-1)/2*Me^2
Tstar = Te*(1+0.032*Me^2+0.58*(TawoverTe-1))

rhostar = Pe/(R*Tstar)
T0 = 288.15;
mew0 = 1.7894e-5;
mewstar = mew0*(Tstar/T0)^(3/2)*(T0+110)/(Tstar+110)
Recstar = rhostar*uinf*c/mewstar

Cfstar = 1.328/Recstar^0.5
Cftstar = 0.074/Recstar^0.2