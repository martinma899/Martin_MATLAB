clc;clear

M1 = 0.43;
T01 = 1870;
P01 = 21.5e5;
M2 = 1.1;
gamma = 1.32;

cosalpha2 = M1/M2*sqrt((1+(gamma-1)/2*M2^2)/(1+(gamma-1)/2*M1^2))
alpha2 = acosd(cosalpha2)

sigmaz = -2*cosalpha2*sind(-alpha2)