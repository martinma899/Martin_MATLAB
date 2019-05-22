clc;clear

l = 0.5;
d1 = 30e-3;
d2 = 45e-3;
c = 0.3;
E1 = 3.1e9;
E2 = 2.5e9;
P = 12e3;

btot = l-c
A1 = pi/4*d1^2
A2 = pi/4*(d2^2-d1^2)

delta1 = P*btot/(E1*A1)

augmat = [1 1 P;c/(E1*A1) -c/(E2*A2) 0]

reducedmat = rref(augmat)

P1 = reducedmat(1,3)
p2 = reducedmat(2,3)

delta2 = P1*c/(E1*A1)

deltatot = delta1+delta2

% question b

augmat = [1 1 P;l/(E1*A1) -l/(E2*A2) 0]

reducedmat = rref(augmat)

P1 = reducedmat(1,3)
P2 = reducedmat(2,3)

deltatot = P1*l/(E1*A1)

% quesion 3

deltatot = P*l/(E1*A1)