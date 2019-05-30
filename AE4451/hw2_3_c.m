clc;clear

Cp = 5190;
R = 2080;

P2 = 20;
P1 = 1;
T2 = 1060;
T1 = 300;

ratio = ((P2/P1)^(R/Cp)-1)/(T2/T1-1)
entropyRate = Cp/R*log(T2/T1)-log(P2/P1)