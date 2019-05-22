clc;clear

M = 0.8;
Ta = 225;
Prc = 12;
T04 = 1300;
itad = 0.92;
itat = 0.85;
itac = 0.85;
itan = 0.95;
burnerP0Ratio = 0.97;
Cp = 1.1e3;
R = 286.9;
r = 1.4;
Pa = 2.65e4;
Qr = 45000e3;
u = M*sqrt(r*R*Ta)

T02 = Ta*(1+(r-1)/2*M^2)
P02 = Pa*(1+itad*(T02/Ta-1))^(r/(r-1))
T03 = T02*(1+1/itac*(Prc^((r-1)/r)-1))
f = ((T04/T03)-1)/(Qr/(Cp*T03)-T04/T03)
P04 = P02*Prc*burnerP0Ratio
T05 = T04-(T03-T02)
P05 = P04*(1-1/itat*(1-T05/T04))^(r/(r-1))
T06 = T05
P06 = P05
ue = sqrt(2*itan*r/(r-1)*R*T06*(1-(Pa/P06)^((r-1)/r)))
PropulsionEfficiency = (2*u/ue)/(1+u/ue)
ThermalEfficiency = ((1+f)*ue^2/2-u^2/2)/(f*Qr)
totalEfficiency = PropulsionEfficiency*ThermalEfficiency
