clc;clear

M1 = 0.43;
M2 = 1.1;
T01 = 1870;
P01 = 21.5e5;
itapt = 0.93;
psimax = -1.3;
MW = 28.6;
Rbar = 8.3144598;
r = 1.32;
R = Rbar/MW*1000;
Cp = R/(1-1/r);
alpha1 = 0;
psiz = -1;

alpha2 = acosd(M1/M2*((1+(r-1)/2*M1^2)/(1+(r-1)/2*M2^2))^((1+r)/(2*(1-r))))
sigmaz = 1/psiz*2*cosd(alpha2)/cosd(alpha1)*sind(alpha1-alpha2)