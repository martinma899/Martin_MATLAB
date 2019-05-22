clc;clear

Twc = 400;
Thg = 3200;
qdot = 15e6;
deltal = 2.5e-3;
kw = 26;

Twg = qdot*deltal/kw+Twc
hg = 0.75*qdot/(Thg-Twg)

kc = 8
Tm = 1370
t = kc*(Twg-Tm)/qdot