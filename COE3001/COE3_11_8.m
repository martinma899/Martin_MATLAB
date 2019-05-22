clc;clear

b = 100e-3;
r = 50e-3;
t = 8e-3;
T = 10e3;
l = 1.5;
G = 76e9;

Am = pi*r^2+2*r*b
lm = 2*pi*r+2*b
J = 4*t*Am^2/lm
phi = T*l/(G*J)
phideg = phi/pi*180
tau = T/(2*t*Am)