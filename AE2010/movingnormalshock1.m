clc;clear
r = 1.4;
R = 287;
T1 = 300;
P1 = 101000;
v1 = 520;
vshock = v1;

M1 = v1/sqrt(r*R*T1)
M2 = nshockM2(M1,r)
T0 = T1*(1+(r-1)/2*M1^2)
T2 = T0/(1+(r-1)/2*M2^2)
v2 = M2*sqrt(r*R*T2)

v1orig = 0;
v2orig = -v2+vshock
M2orig = v2orig/sqrt(r*R*T2)
T01orig = T1
T02orig = T2*(1+(r-1)/2*M2orig^2)