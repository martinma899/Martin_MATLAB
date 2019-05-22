clc;clear

% gas constants
R = 287
r = 1.4
Rt = 1000*8.3144598/30
rt = 1.33
Cpt = rt*Rt/(rt-1)

% ambient conditions
M = 0.7
Pa = 18.75e3
Ta = 216.7

% power turbine inlet condition
mdot = 100
P01 = 40e3
T01 = 1200

% losses
itap = 0.79
itan = 0.98
itapt = 0.89
itag = 0.97

u = sqrt(r*R*Ta)*M
PaoverP01 = Pa/P01
T3soverT01 = PaoverP01^((rt-1)/rt)
deltah = Cpt*T01*(1-T3soverT01)
T3s = T3soverT01*T01

alpha = 1-u^2/(2*deltah)*(itan/(itap^2*itag^2*itapt^2))

Tprop = itap*itag*itapt*alpha*deltah*mdot/u

Texhaust = mdot*(sqrt(2*(1-alpha)*itan*deltah)-u)
