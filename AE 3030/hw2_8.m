clc;clear

mew = 1.789e-5;
rho = 1.23;
u = 63.0326;
l = 1.6;

xtr = 500000*mew/(rho*u)

Rel = rho*u*l/mew
xtroverL = xtr/l

cd1 = 1.328/Rel^0.5*xtroverL^0.5
cd2 = 0.07375/Rel^0.2*(1-xtroverL^0.8)

cd = cd1+cd2