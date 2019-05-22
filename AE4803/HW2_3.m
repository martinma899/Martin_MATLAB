clc;clear


MW = 27.6;
Rbar = 8.3144598;
R = Rbar/MW*1000;
gamma = 1.32;
Cp = R/(1-1/gamma)

c2 = 795;
alpha2 = 59;
T02 = 1975;
P02 = 18.5e5;
rm = 0.4;
phi = 0.9;
M3rel = 0.9;

c2theta = c2*sind(alpha2)
cz = c2*cosd(alpha2)
u = cz/phi
w2theta = c2theta-u
w2 = sqrt(w2theta^2+cz^2)
T2 = T02-c2^2/(2*Cp)
M2rel = w2/sqrt(gamma*R*T2)

Omega = u/rm
rpm = 30/pi*Omega

w3 = sqrt((T2+w2^2*0.5/Cp)/(1/(M3rel^2*gamma*R)+0.5/Cp))

cosbeta3 = cz/w3
beta3 = -acosd(cosbeta3)
c3theta = w3*sind(beta3)+u
alpha3 = atand(c3theta/cz)

beta2 = atand(w2theta/cz)

stagger = mean([beta2,beta3])

psi = (c3theta-c2theta)/u

w3theta = w3*sind(beta3)
R = -(w2theta+w3theta)/(2*u)