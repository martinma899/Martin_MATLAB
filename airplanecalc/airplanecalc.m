clc;clear
% all units in SI
P = 101325
T = 288.15
R = 286.9
r = 1.4
rho = P/(R*T)

v = 30
l = 0.5
mew = 1.81e-5

Rey = v*l*rho/mew

a = sqrt(r*R*T)
M = v/a

A = 0.1*0.8

Cd = 0.02507
Fd = Cd*0.5*v^2*rho*A

Cl = 0.43495
Fl = Cl*0.5*v^2*rho*A

liftingm = Fl/9.81

mass = 1835/1000

twentyfourByTwelveInchSquareInMeterSquare = 304.8*304.8*2/1000000

rhoply = 900
tply = 0.003175
mply = 0.5
Aply = mply/(rhoply*tply)
lengthplycm = sqrt(Aply)*100