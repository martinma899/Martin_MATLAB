clc;clear

P = 200e3;
l = 2;
t = 20e-3;
b1 = 100e-3;
b2 = 115e-3;
E = 96e9;

% after symbolic integration
delta1 = 2*l*P/((b2-b1)*E*t)*(log((b2-b1)/4+b1)-log(b1))
delta2 = l*P/((b2-b1)*E*t)*(log(b2)-log((b2-b1)/4+b1))
deltac = delta1+delta2
delta3 = l*P/((b2-b1)*E*t)*(log((b2-b1)/2+b1)-log((b2-b1)/4+b1))
deltab = delta2-delta3
