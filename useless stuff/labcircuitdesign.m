clc;clear;clf


C = 0.01001e-6
R = 14720+988.8
fc = 1/(2*pi*R*C)
omegac = fc*2*pi

Vampin = 1.5;

K = 1.4
Q = 1/(3-K)

f = linspace(500,1200);
omega = 2*pi*f;

s = 1i*omega;

totalgain = abs(K*(1./(1+1/Q*s./omegac+(s./omegac).^2)));
ampvoltage = Vampin*totalgain;

vconst = 1.4;

hold on
plot(f,ampvoltage)
plot([1000,1000,900,900],[0.6 3.5,3.5,0.6],'r-')
plot([500,1200],[vconst,vconst])