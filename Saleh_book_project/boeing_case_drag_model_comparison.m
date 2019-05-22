clc;clear;close all

% some characteristics of aircraft
weight = 564000 %lbf
S = 5500 %ft^2
v = 278.489 %f/s
rho = 1.225/(3.28084^3*14.5939)

% raw data
alpha0 = 5.7 % degrees
C_Lat0 = 1.11
C_Dat0 = 0.102
C_Lalpha = 5.7 % per rad
C_Dalphaat0 = 0.66 % per rad

% CL model
C_L0 = C_Lat0-C_Lalpha*alpha0/180*pi

% QDP model
K = C_Dalphaat0/(2*C_Lat0*C_Lalpha)
C_D0 = C_Dat0-K*C_Lat0^2

% offset QDP model
C_Lnominal = 0.3
K_alt = C_Dalphaat0/(2*(C_Lat0-C_Lnominal)*C_Lalpha)
C_D0_alt = C_Dat0-K_alt*(C_Lat0-C_Lnominal)^2

% visualization
alphadeg = linspace(-5,15,101);
alpharad = alphadeg/180*pi;
C_L = C_Lalpha*alpharad+C_L0;
C_D_qdp = K*C_L.^2+C_D0;
C_D_alt = K_alt*(C_L-C_Lnominal).^2+C_D0_alt;

hold on
plot(C_L,C_D_qdp,'b.-')
plot(C_L,C_D_alt,'k.-')
legend('QDP','Offset QDP')
grid on



