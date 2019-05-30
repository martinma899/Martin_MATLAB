clc;clear

T = 1500000;
rhof = 672;
rhoo = 1400;
Pa = 101300;
P02 = Pa*145;
OtoF = 8/3;
T02 = 3400;
r = 1.16;
MW = 24;
Rbar = 8314;
Ct = 1.65;
deltaPpump = 26.5e6-0.1e6;

R = Rbar/MW
ueq = Ct/(1/sqrt(R*T02)*sqrt(r*(2/(r+1))^((r+1)/(r-1))))

mdot = T/ueq
mdotf = mdot*3/11
mdoto = mdot*8/11

Wdotp_f = mdotf*deltaPpump/rhof
Wdotp_o = mdoto*deltaPpump/rhoo
Wdotp_total = Wdotp_f+Wdotp_o
