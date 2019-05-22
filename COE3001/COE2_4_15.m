clc;clear

P = 12e3;
Aa = 8.92;
As = 1.03;
Ea = 10e6;
Es = 29e6;

sigmaa = 2*P/(Aa+2*Es*As/Ea)
sigmas = 4*P*Es/Ea*(1/(Aa+2*Es*As/Ea))

Raway1 = sigmaa*Aa
Rsway1 = sigmas*As

Raway1+Rsway1

rref([1 1 2*P;-2/(Ea*Aa) 1/(Es*As) 0])