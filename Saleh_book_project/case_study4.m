clc;clear

name = 'C-5A'
condition = 'sea level 146kt'

alpha0 = 2.7 % degrees
C_Lat0 = 1.29
C_Dat0 = 0.145
C_Lalpha = 6.08 % per rad
C_Dalphaat0 = 0.622 % per rad

C_L0 = C_Lat0-C_Lalpha*alpha0/180*pi
K = C_Dalphaat0/(2*C_Lat0*C_Lalpha)
C_D0 = C_Dat0-K*C_Lat0^2

weight = 580723 %lbf
S = 6200 %ft^2
b = 219.2 %ft
c = 30.1 %ft

engine = 'TF39-GE-1'
number_of_engines = 4

Tmax_sea = 40805 %lbf
Tmax_cruise = 'TBD' %lbf
h_cruise = 'TBD' %ft

rho_sea = density(0) % SI
rho_cruise = 'TBD'

n = 'TBD'
