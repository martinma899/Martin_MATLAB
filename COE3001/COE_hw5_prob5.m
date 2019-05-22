clc;clear

% unit: inch, lbf. 

d1 = 1.25;
d2 = 0.875;
l1 = 20;
l2 = 10;
G = 11000e3;

epsilon45 = 0.0012;

tau1 = epsilon45*2*G
tau2 = tau1*l1*d2/(d1*l2)

Ip1 = pi/32*d1^4
Ip2 = pi/32*d2^4

T1 = tau1*Ip1/(d1/2)
T2 = tau2*Ip2/(d2/2)
Tb = T1+T2

U1 = T1^2*l1/(2*G*Ip1)
U2 = T2^2*l2/(2*G*Ip2)
U = U1+U2

phi = 2*U/Tb
phideg = phi/pi*180