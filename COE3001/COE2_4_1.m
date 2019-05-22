clc;clear

d1 = 0.25;
d2 = 0.28;
d3 = 0.35;
l = 4;
Eb = 15e6;
Es = 30e6;
delta = 0.003;

As = pi/4*(d3^2-d2^2)
Ab = pi/4*d2^2

eqnmat = [1 1 delta/l*(Es*As+Eb*Ab);l/(Es*As) -l/(Eb*Ab) 0]

reduced = rref(eqnmat)

Ps = reduced(1,3)
Pb = reduced(2,3)

P = Pb+Ps

ratio = Es/Eb

sigmas = 22e3;
sigmab = 11e3;

Psmax = sigmas*As
Pbmax = sigmab*Ab

Pmax = Psmax+Pbmax