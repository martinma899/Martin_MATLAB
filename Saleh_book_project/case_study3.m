clc;clear

name = 'Boeing 747'
condition = 'Sea level 165KTAS flats and slats deployed'

alpha0 = 5.7 % degrees
C_Lat0 = 1.11
C_Dat0 = 0.102
C_Lalpha = 5.7 % per rad
C_Dalphaat0 = 0.66 % per rad

C_L0 = C_Lat0-C_Lalpha*alpha0/180*pi
K = C_Dalphaat0/(2*C_Lat0*C_Lalpha)
C_D0 = C_Dat0-K*C_Lat0^2

weight = 564000 %lbf
S = 5500 %ft^2
b = 195.68 %ft
c = 27.31 %ft

engine = 'Pratt Whitney	JT9D-3A'
number_of_engines = 4

Tmax_sea = 44250 %lbf
Tmax_cruise = 10200 %lbf
h_cruise = 35000 %ft

rho_sea = density(0) % SI
rho_cruise = density(h_cruise/3.28084)

n = log(Tmax_cruise/Tmax_sea)/log(rho_cruise/rho_sea)
