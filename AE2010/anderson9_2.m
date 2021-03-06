clc;clear
P1 = 2.65e4;
T1 = 223.3;
M1 = 4;
r = 1.4;
M1n = M1*sind(30)
M2n = nshockM2(M1n,1.4)
M2 = M2n/sind(30)
P2 = P1*(1+2*r/(r+1)*(M1n^2-1))
T2 = T1*(1+2*r/(r+1)*(M1n^2-1))*(2+(r-1)*M1n^2)/((r+1)*M1n^2)
T02 = T1*(1+(r-1)/2*M1^2)
P02 = P2*(1+(r-1)/2*M2^2)^(r/(r-1))
Cp = 1003;
R = 287
M1 = M1n;
deltas = Cp*log((1+2*r/(r+1)*(M1^2-1))*(2+(r-1)*M1^2)/((r+1)*M1^2))...
    +R*log(1+2*r/(r+1)*(M1^2-1))