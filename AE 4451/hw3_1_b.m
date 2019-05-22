clc;clear

T02 = 350
T04 = 800
Pmin = 0.5;
Pmax = 15;
r = 1.289;

T03 = T02*(Pmax/Pmin)^((r-1)/r)
T05 = T04*(Pmin/Pmax)^((r-1)/r)
%itaBrayton = 1-((T05-T02)/(T04-T03))
itaBrayton = 1-(Pmin/Pmax)^((r-1)/r)

bottomFactor = 1.84203746/700

Cp2 = 0.9e3
Cp3 = 1.15e3
Cp4 = 1.21e3
Cp4alt =  1.17e3;
Cp5 = 0.96e3
Cp5alt = 0.92e3;

%WorkPerMass = (T04*Cp4-T05*Cp5)-(T03*Cp3-T02*Cp2)
WorkPerMass = (T04*Cp4alt-T05*Cp5alt)-(T03*Cp3-T02*Cp2)