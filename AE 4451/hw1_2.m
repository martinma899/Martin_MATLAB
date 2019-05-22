clc;clear

Te = 520
ue = 290
Pe = 96.3e3
mdot = 22
ui = 30
Ta = 290
Pa = 0.95*101325
R = 286.9
rhoa = Pa/(R*Ta)
rhoe = Pe/(R*Te)
Ai = mdot/(rhoa*ui)
Ae = mdot/(rhoe*ue)

Ty = Ae*(Pe-Pa)+rhoe*ue^2*Ae
Fxcvonsolid = rhoa*ui^2*Ai