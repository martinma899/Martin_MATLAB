clc;clear

P1 = 40e3;
P2 = 60e3;
P3 = 60e3;
h = 10.5*12;
A = 15.5;
E = 30e6;

V = h*A

sigma1 = P1/A
u1 = 0.5*sigma1^2/E
U1 = u1*V

N2 = P1+P2
sigma2 = N2/A
u2 = 0.5*sigma2^2/E
U2 = u2*V

N3 = P1+P2+P3
sigma3 = N3/A
u3 = 0.5*sigma3^2/E
U3 = u3*V

U = U1+U2+U3
