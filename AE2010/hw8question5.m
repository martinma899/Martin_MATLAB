clc;clear

P1 = 20000;
T1 = 260;
M1 = 3;
r = 1.4;

P01 = P1*pratio(M1,r)
T0 = T1*tratio(M1,r)
P02 = P01*np0ratio(M1,r)
P2 = P1*npratio(M1,r)
M2 = nshockM2(M1,r)
T2 = T0/tratio(M2,r)