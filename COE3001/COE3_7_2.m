clc;clear
P = 50*6600;
tauallow = 6000;
d = 1.5;

T = tauallow*d^3*pi/16
omega = P/T
omegarpm = omega*60/(2*pi)