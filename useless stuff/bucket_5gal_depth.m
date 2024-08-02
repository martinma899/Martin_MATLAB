clc;clear

a0 = 14.5;
R0 = 5.75;
r = 5; 
V = 5*231; 

h = a0*r/(R0-r)
alpha = atand(r/h)

V1 = 1/3*pi*r^2*h

R = ((V+V1)*tand(alpha)*3/pi)^(1/3)

a = R/tand(alpha)-h