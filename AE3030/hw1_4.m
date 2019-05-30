clc;clear

M1 = 3;
theta1 = 10;
P1 = 5;
T1 = 500;
r = 1.4;

[beta1,~] = shockangle (M1,theta1,r,1,45,89.9)
M1n = M1*sind(beta1)
M2n = nshockM2(M1n,r)
M2 = M2n/sind(beta1-theta1)
T2overT1 = nTratio(M1n,r)
P2overP1 = npratio(M1n,r)
Aratio = 1/P2overP1*T2overT1*M1/M2*sqrt(1/T2overT1)
Dratio = sqrt(Aratio)