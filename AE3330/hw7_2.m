clc;clear

mfull = 1315;
mmaxfuel = 168;
s = 16.3;
cd0 = 0.026;
k = 0.054;
cl0 = 0.02;
clalpha = 0.12;
Pmax = 216e3;
g = 9.81;
c = 0.076e-6*g;
ita = 0.8;
m = 0.6;
rho = density(2000);

R = 200e3;
m1 = 1000;
AEmax = sqrt(1/(4*k*cd0))
CL = sqrt(cd0/k)
CD = 2*cd0
mfuel = m1*(1-exp(-c/ita*1/AEmax*R))
E = 20*60;
mfuel2 = m1-(1/sqrt(m1)+E*c/ita*CD/(CL^(3/2))*sqrt(g/(2*rho*s)))^(-2)