clc;clear

m = 37500;
g = 9.81;
s = 96;
h = 6450;
rho0 = density(0);
rhoh = density(h);
CLalpha = 0.125;
CL0 = 0.025;
K = 0.085;
CD0 = 0.012;
alphamax = 14; 
v1 = 120;
v2 = 140;
v3 = 160;

L1 = m*g
L2 = L1
L3 = L1

CL1 = 2*m*g/(rhoh*v1^2*s)
CL2 = 2*m*g/(rhoh*v2^2*s)
CL3 = 2*m*g/(rhoh*v3^2*s)

alpha1 = (CL1-CL0)/CLalpha
alpha2 = (CL2-CL0)/CLalpha
alpha3 = (CL3-CL0)/CLalpha

CL = 0.5

v4 = sqrt(2*m*g/(rhoh*s*CL))
v5 = sqrt(2*m*g/(rhoh*s*0.3))
v6 = sqrt(2*m*g/(rhoh*s*0.7))

alpha = (CL-CL0)/CLalpha
CD = CD0+K*CL^2
Treq = 0.5*rhoh*v4^2*s*CD

CLmax = CL0+CLalpha*alphamax
vstall = sqrt(2*m*g/(rhoh*s*CLmax))
TCLmax = 0.5*rhoh*vstall^2*s*CD0+2*K*(m*g)^2/(rhoh*s*vstall^2)

R2max = 0.25*(27/(CD0*K^3))^0.25
ROSmin = sqrt(2*m*g/(rhoh*s))/R2max
tmax = h/(ROSmin)/60

alphaeff = (sqrt(CD0/K)-CL0)/CLalpha
CLeff = CL0+CLalpha*alphaeff
CDeff = CD0+K*CLeff^2
AEmax = CLeff/CDeff
veff = sqrt(2*m*g/(rhoh*s*CLeff))
Teff = 0.5*rhoh*s*veff^2*CDeff

% alphalist = linspace(0,14,101);
% CLlist = CL0+CLalpha*alphalist;
% CDlist = CD0+K*CLlist.^2;
% % AElist = (CLlist)./(CD0+K*CLlist.^2);
% vlist = sqrt(2*m*g./(rhoh*s*CLlist));
% Tlist = 0.5*rhoh*s*vlist.^2.*CDlist;
% Plist = vlist.*Tlist;
% 
% figure(1)
% plot(alphalist,Tlist/1000,'b.-')
% hold on
% plot(alphaeff,Teff/1000,'ro')
% xlabel('alpha (deg)')
% ylabel('Treq (kN)')
% 
% figure(2)
% plot(vlist,Tlist/1000,'b.-')
% hold on
% plot(veff,Teff/1000,'ro')
% xlabel('air speed (m/s)')
% ylabel('Treq (kN)')
% 
% figure(3)
% plot(vlist,Plist/1000,'b.-')
% xlabel('air speed (m/s)')
% ylabel('Preq (kw)')






