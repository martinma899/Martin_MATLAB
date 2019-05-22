clc;clear

mew = 0.5;
mg = 100;

A = [1+mew 1-mew;1-mew -1-mew];
b = [sqrt(2)*mg;0];

Nvec = inv(A)*b

N1 = sqrt(2)/2*mg*((1+mew)/(1+mew^2))
N2 = sqrt(2)/2*mg*((1-mew)/(1+mew^2))

R = 0.1

torque = sqrt(2)*R*mg*(mew/(1+mew^2))