clc;clear

name = 'Convair 880M'
condition = 'Sea level 134 KTAS'

alpha0 = 5.2 % degrees
C_Lat0 = 1.03
C_Dat0 = 0.154
C_Lalpha = 4.66 % per rad
C_Dalphaat0 = 0.43 % per rad

C_L0 = C_Lat0-C_Lalpha*alpha0/180*pi
K = C_Dalphaat0/(2*C_Lat0*C_Lalpha)
C_D0 = C_Dat0-K*C_Lat0^2

engine = 'GE CJ805-3B'
number_of_engines = 4

weight = 155000 %lbf
S = 2000 %ft^2
b = 120 %ft
c = 18.94 %ft

Tmax_sea = 11650 %lbf
Tmax_cruise = 'TBD' %lbf
h_cruise = 'TBD' %ft

rho_sea = density(0) % SI
rho_cruise = 'TBD'

n = 'TBD'