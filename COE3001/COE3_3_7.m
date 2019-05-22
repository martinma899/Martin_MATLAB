clc;clear

l = 9;
G = 11.4e6;
P = 25;
d = 0.5;

T = 2*P*l
ro = d/2
Ip = pi/32*d^4
gammaouter = T*ro/(G*Ip)

phi = T*l/(G*Ip)
phideg = phi*360/(2*pi)