clc;clear

% gas constants
R = 287
r = 1.4
Cp = r*R/(r-1)

T0 = 288.15;
ita_pc = 0.87;
Prc_st = 2.8^0.25;

Wdotovermdot = 1/ita_pc*T0*Cp*(Prc_st^((r-1)/r)-1)