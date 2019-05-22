clc;clear

M1 = 2;
P1 = 1;
T1 = 288;
r = 1.4;
theta = 20;

[beta1,beta2] = shockangle (M1,theta,r,90,73,45);
beta = beta2

M1n = sind(beta)*M1
M2n = nshockM2(M1n,r)
M2 = M2n/(sind(beta-theta))

P2 = npratio(M1n,r)*P1
T2 = nTratio(M1n,r)*T1

P01 = P1*pratio(M1,r)
P02 = P01*np0ratio(M1n,r)

T0 = T1*tratio(M1,r)
T02 = T2*tratio(M2,r)