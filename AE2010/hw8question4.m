clc;clear

r = 5/3;
R = 2077;

v1 = 2500;
T1 = 300;

M1 = v1/sqrt(r*R*T1)
M2 = nshockM2(M1,r)
T0 = T1*tratio(M1,r)
T2 = T0/tratio(M2,r)
v2 = M2*sqrt(r*R*T2)