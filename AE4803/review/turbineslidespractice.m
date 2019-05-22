clc;clear;

MW = 28.7;
Rbar = 8.3144598;
r = 1.33;
R = Rbar/MW*1000;
Cp = R/(1-1/r);

T01 = 1800;
M1 = 0.55;
alpha1 = 0;
alpha2 = 54;
u = 526;
rm = 0.55;
beta3 = -49;

T1 = T01/(1+(r-1)/2*M1^2)
cz = M1*sqrt(r*R*T1)
c2 = cz/cosd(alpha2)
T02 = T01
T2 = T02-c2^2/2/Cp
M2 = c2/sqrt(r*R*T2)
c2t = c2*sind(alpha2)