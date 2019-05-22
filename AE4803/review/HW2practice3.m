clc;clear

c2 = 795;
alpha2 = 59;
T02 = 1975;
P02 = 18.5e5;
rm = 0.4;
phi = 0.9;
Mrel3 = 0.9;
r = 1.32;
MW = 27.6;
Rbar = 8.3144598;
R = Rbar/MW*1000;
Cp = R/(1-1/r);

cz = c2*cosd(alpha2)
u = cz/phi
omega = u/rm
RPM = omega*30/pi
T2 = T02-c2^2/(2*Cp)
c2t = c2*sind(alpha2)
w2t = c2t-u
w2 = sqrt(w2t^2+cz^2)
Mrel2 = w2/sqrt(r*R*T2)
T02rel = T2+w2^2/(2*Cp)
T03rel = T02rel
T3 = T03rel/(1+(r-1)/2*Mrel3^2)
w3 = Mrel3*sqrt(r*R*T3)
beta3 = -acosd(cz/w3)
w3t = -sqrt(w3^2-cz^2)
c3t = w3t+u
alpha3 = atand(c3t/cz)
psi = (c3t-c2t)/u
xi = atand((w3t+w2t)/(2*cz))
Rapprox = 1/2*(1-phi*(tand(alpha2)+tand(beta3)))
