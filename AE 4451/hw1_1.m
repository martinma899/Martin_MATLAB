clc;clear

A1 = 2.3e3/144
A2 = A1*1.44
mdot = 10/32.174
P1 = 5*144
v1 = 365
P2 = 5.4*144
v2 = 174*5280/3600
Pa = 4.9*144
rho1 = mdot/(v1*A1)
rho2 = mdot/(v2*A2)

FsolidonCV = -P1*A1-(A2-A1)*Pa+P2*A2-rho1*v1^2*A1+rho2*v2^2*A2