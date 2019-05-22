clc;clear

M1 = 3;
T1 = 500;
P1 = 15;
theta = 10;
r = 1.4;
R = 1716;

[beta,~] = shockangle (M1,theta,r,1,50,89)
M1n = M1*sind(beta)
P2 = P1*npratio(M1n,r)
[M3] = prandtlmeyer (M1,theta,r,3,5)
M3 = M3(1)
P3 = P1*pratio(M1,r)/pratio(M3,r)
Ptot = P2-P3
L = Ptot*cosd(theta)
D = Ptot*sind(theta)