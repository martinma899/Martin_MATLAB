clc;clear

Wdotovermdot = -292e3;
rpm = 8750;
Omega = rpm*pi/30;
M1 = 0.43;
T01 = 1870;
P01 = 21.5e5;
ita_pt = 0.93;
psi_max = -1.3;
MW = 28.6;
Rbar = 8.3144598;
R = Rbar/MW*1000;
gamma = 1.32;
r_max = 0.45;

nmin = Wdotovermdot/(psi_max*(Omega*r_max)^2)

Cp = R/(1-1/gamma)

P02 = P01*((1/Cp*Wdotovermdot+T01)/T01)^((gamma*ita_pt)/(gamma-1))

a1 = sqrt(gamma*R*T01/(1+(gamma-1)/2*M1^2))

Cz = M1*a1

phi = Cz/(r_max*Omega)