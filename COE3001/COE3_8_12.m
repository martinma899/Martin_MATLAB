clc;clear
d1 = 25e-3;
d2 = 30e-3;
d3 = 37.5e-3;
l = 550e-3;
T = 400;
G = 80e9;

Ip1 = pi/32*d1^4
Ip2 = pi/32*(d3^4-d2^4)
T1overT2 = Ip1/Ip2
T2 = T/(1+T1overT2)
T1 = T2*T1overT2

tau1 = T1*d1/2/Ip1
tau2 = T2*d3/2/Ip2

phi = T2*l/(G*Ip2)
phideg = phi/pi*180
kT = T/phi