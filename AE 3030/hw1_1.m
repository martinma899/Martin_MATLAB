clc;clear

M1 = 2;
T1 = 520;
P1 = 14.7;
be = 50;
r = 1.4;
R = 1716;

M1n = M1*sind(be)
M2n = nshockM2(M1n,r)
T2 = nTratio(M1n,r)*T1
P2 = npratio(M1n,r)*P1
th = thetaAngle(M1,r,be)
M2 = M2n/sind(be-th)