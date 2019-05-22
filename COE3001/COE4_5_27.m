clc;clear

a = 8;
l = 10;
q0 = 200;
M0 = 400;

f1 = a*q0*0.5;
f2 = (l-a)*q0*0.5;

Rb = (f1*2/3*a+f2*(a+2/3*(l-a))+M0)/l;
Ra = f1+f2-Rb;

x0 = sqrt(Ra*2/25);

Mmax = M0-100/(3*a)*x0^3+Ra*x0

% clear;clc
% 
% [a,~] = recsolve (0,10)
% 
% l = 10;
% q0 = 200;
% M0 = 400;
% 
% f1 = a*q0*0.5
% f2 = (l-a)*q0*0.5
% 
% Rb = (f1*2/3*a+f2*(a+2/3*(l-a))+M0)/l
% Ra = f1+f2-Rb
% 
% Ra-f1
% 
% x0 = sqrt(Ra*a/100)
% 
% Mmax = M0-100./(3.*a).*x0.^3+Ra.*x0

clear;clc

a = linspace(0,10,100000);

l = 10;
q0 = 200;
M0 = 400;

f1 = a*q0*0.5;
f2 = (l-a)*q0*0.5;

Rb = (f1.*2/3.*a+f2.*(a+2/3.*(l-a))+M0)./l;
Ra = f1+f2-Rb;

x0 = sqrt(Ra.*a./100);


Mmax = M0-100./(3.*a).*x0.^3+Ra.*x0;

plot(a,Mmax)

[Mabsmax,ind] = max(Mmax)
acrit = a(ind)