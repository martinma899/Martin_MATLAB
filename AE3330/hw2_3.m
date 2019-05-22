clc;clear

PA0 = 1600e3;
rho0 = 1.225;
rhoh = density(8700)
ita = 0.8;
n = 0.7;

PA = PA0*(rhoh/rho0)^n
Pes = PA/ita