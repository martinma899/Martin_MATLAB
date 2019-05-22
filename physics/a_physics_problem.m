clc;clear

m = 0.6;
r = 1.2;
tau = 5.01;
Tmax = 60;
g = 9.81;
mew = 0.6;

tmax = sqrt(Tmax*r/m)/(tau/m-g*mew)

theta = (tau/m-g*mew)^-1*0.5*Tmax/m

rev = theta/(2*pi)