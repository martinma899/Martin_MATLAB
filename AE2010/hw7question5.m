clc;clear
P = 14e6;
T = 300.15;
A = 6.5e-4;
v = 300;
Pexit = 7.4e6;
Texit = 250;
R = 259.8;
Pamb = 101000;

rhoexit = Pexit/(R*Texit)
mdot = rhoexit*v*A
Fmomentum = mdot*v
Fpressure = (Pexit-Pamb)*A
T = Fmomentum+Fpressure

Fmomentum/T
Fpressure/T