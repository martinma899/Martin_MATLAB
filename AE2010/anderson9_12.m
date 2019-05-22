clc;clear;
r = 1.4;
M1 = 3;
T1 = 285;
P1 = 101000;
t = 30.6;
M1n = M1*sind(t)
P2 = P1*(1+2*r/(r+1)*(M1n^2-1))
[betaa,betab] = shockangle (M1,t,r,1,57,89)
M2n = nshockM2(M1n,r)
M2 = M2n/sind(betaa-t)
T2 = T1*(1+2*r/(r+1)*(M1n^2-1))*(2+(r-1)*M1n^2)/((r+1)*M1n^2)
pfuncM2 = sqrt((r+1)/(r-1))*atand(sqrt((r-1)/(r+1)*(M2^2-1)))-atand(sqrt(M2^2-1))
pfuncM3 = t-pfuncM2
M3 = 1.42
T3 = (1+(r-1)/2*M2^2)/(1+(r-1)/2*M3^2)*T2
P3 = (1+(r-1)/2*M2^2)^(r/(r-1))/(1+(r-1)/2*M3^2)^(r/(r-1))*P2