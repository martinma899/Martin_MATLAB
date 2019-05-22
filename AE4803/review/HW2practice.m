clc;clear

deltah = -292e3;
RPM = 8750;
M4 = 0.43;
T04 = 1870;
P04 = 21.5e5;
itapt = 0.93;
psimax = -1.3;
MW = 28.6;
Rbar = 8.3144598;
r = 1.32;
R = Rbar/MW*1000;
rmmax = 0.45;
Cp = R/(1-1/r);

umax = rmmax*RPM*pi/30
deltahmaxstage = psimax*umax^2

T05 = T04+deltah/Cp

P05 = P04*(T05/T04)^(r/((r-1)*itapt))

