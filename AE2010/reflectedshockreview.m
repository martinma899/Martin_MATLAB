clc;clear

theta = 10;
M1 = 3.6;
P1 = 101000;
T1 = 300;
r = 1.4;

[beta1,beta2] = shockangle (M1,theta,r,90,85,1);
beta = beta2
M1n = M1*sind(beta)
M2n = nshockM2(M1n,r)
M2 = M2n/sind(beta-theta)
[beta1,beta2] = shockangle (M2,theta,r,90,85,1);
betareflected = beta2
phi = betareflected-theta
M2n2 = M2*sind(beta2)
M3n = nshockM2(M2n2,r)
M3 = M3n/sind(betareflected-theta)