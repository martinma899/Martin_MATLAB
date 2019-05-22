clc;clear

d1 = 0.5;
d2 = 3;
P1 = 28;


T1 = P1*d2
reducedmat = rref([1 1/sqrt(2) 0;0 1/sqrt(2) -84])
T2 = reducedmat(1,3)
T3 = reducedmat(2,3)
Ip = pi/32*d1^4

tau1 = T1*d1/2/Ip
tau2 = (T2*d1/2)/Ip
tau3 = (T3*d1/2)/Ip