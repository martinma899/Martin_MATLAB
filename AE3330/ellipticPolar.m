clc;clear

a = 30
e = 0.8
P = a*(1-e^2)

phi = linspace(0,2*pi,101);

r = P./(1+e*cos(phi-pi/4));

polarplot(phi,r,'b.-')
