clc;clear

A = 50e-4;
u1 = 100;
T1 = 500;
M2 = 2;
R = 461.5;
r = 1.3;

M1 = u1/sqrt(r*R*T1);
As = A/sqrt(1/M1^2*(2/(r+1)*(1+(r-1)/2*M1^2))^((r+1)/(r-1)))
M2 = 2
A2 = As*sqrt(1/M2^2*(2/(r+1)*(1+(r-1)/2*M2^2))^((r+1)/(r-1)))