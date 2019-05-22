clc;clear

name = 'Jetstar II'
condition = 'Sea level M=0.2'

alpha0 = 6.5 % degrees
C_Lat0 = 0.737
C_Dat0 = 0.095
C_Lalpha = 5 % per rad
C_Dalphaat0 = 0.75 % per rad

C_L0 = C_Lat0-C_Lalpha*alpha0/180*pi
K = C_Dalphaat0/(2*C_Lat0*C_Lalpha)
C_D0 = C_Dat0-K*C_Lat0^2

weight = 38204 %lbf
S = 542.5 %ft^2
b = 53.75 %ft
c = 10.93 %ft

engine = 'Garrett	TFE731-3'
number_of_engines = 4

Tmax_sea = 3700 %lbf
Tmax_cruise = 817 %lbf
h_cruise = 40000 %ft

rho_sea = density(0) % SI
rho_cruise = density(40000/3.28084)

n = log(Tmax_cruise/Tmax_sea)/log(rho_cruise/rho_sea)
