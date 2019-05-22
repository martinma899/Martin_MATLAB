clc;clear

b = 50e-3;
alpha = 35;
t = 90-alpha

sigmawood = 11.5e6;
tauwood = 4.5e6;
sigmaglue = 3.5e6;
tauglue = 1.25e6;

A = b*b
P1 = sigmawood*A
P2 = 2*A*tauwood
P3 = 2*A*sigmaglue/(1+cosd(2*t))
P4 = 2*A*tauglue/sind(2*t)