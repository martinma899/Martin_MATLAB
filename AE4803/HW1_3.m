clc;clear

psi = 0.41;
phi = 0.5;
 
cz = 165;

r = 1.4;
R = 287;
T0 = 288;

P0 = 1e5;
ita_st = 0.88;

[beta1,~] = recsolveHW1_3(-80,-20)
beta2 = beta1+25

alpha1 = atand(1/phi+tand(beta1))
alpha2 = atand(1/phi+tand(beta2))

u = cz/phi
M0 = u/sqrt(r*R*T0)

P02 = P0*(1+ita_st*(r-1)*M0^2*psi)^(r/(r-1))

P02overP0 = P02/P0

w1 = abs(cz/sind(beta1))"?
