clc;clear

alpha1 = 0;
alpha2 = 65.1089;
bzoverh = 2.5;
Re = 1e5;

zetastar = 1.04+0.06*((alpha1+alpha2)/100)^2
Cnozzle = 0.993+0.021*bzoverh

zeta = (zetastar*Cnozzle-1)

M2 = 1.1
r = 1.32

fractional_stagnation_pressure_loss = ...
  1-((1+(r-1)/2*M2^2)*(1-(1-(1+(r-1)/2*M2^2)^-1)/(1-zeta)))^(r/(r-1))