clc;clear

M1 = 3;
theta1 = 10;
r = 1.4;

[beta1,~] = shockangle (M1,theta1,r,1,45,89.9)
M1n = M1*sind(beta1)
M2n = nshockM2(M1n,r)
M2 = M2n/sind(beta1-theta1)
theta2 = theta1
[beta2a,beta2b] = shockangle (M2,theta2,r,1,45,89.9)