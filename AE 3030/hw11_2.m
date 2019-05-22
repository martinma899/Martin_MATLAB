clc;clear

alfa = [-2 0 2 4 6 8 10 12 14];
Cl = [0.05 0.25 0.44 0.64 0.85 1.08 1.26 1.43 1.56];

Clthis = interp1(alfa,Cl,5,'spline')

M = 0.6

Cltrans = Clthis/sqrt(1-M^2)