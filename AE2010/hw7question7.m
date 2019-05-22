clc;clear

T = 288.15-6.5*11000/1000
gamma = 1.4;
M = 2.3;
T0 = T*(1+(gamma-1)/2*M^2)

T0 = 450+273.15
M = sqrt((T0/T-1)*2/(gamma-1))