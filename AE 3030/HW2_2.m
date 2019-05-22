clc;clear

Aratio = 0.8;
Pt = 2100;
Pi = 14.696*144;
R = 1716;
rhoi = 23.77e-4;
r = 1.4;
Ti = Pi/(rhoi*R)
ai = sqrt(r*R*Ti)



rhot = rhoi*(Pt/Pi)^(1/r)

ui = sqrt((13332.2)*2/(1.225*(1-(1/12)^2)))

Mi = ui/ai