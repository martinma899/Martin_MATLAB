clc;clear
T = -8e3;
d = 2;
G = 11.8e6;
v = 0.303

taumax = -T*16/pi/d^3
sigmamax = taumax
E = G*2*(1+v)

gammamax = taumax/G
epsilonmax = sigmamax/E