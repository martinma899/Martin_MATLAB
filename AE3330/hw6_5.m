clc;clear

m = 33100;
s = 88.2;
rho = density(3000);
rho0 = density(0);
cd0 = 0.015;
K = 0.05;
g = 9.81;
vmax = 200;
nmax = 2.5;
nmin = -1;
clmax = 2.8;

v = linspace(0,vmax,101);
n = v.^2*rho0*s*clmax/(2*m*g);
nneg = -n;
n(n>nmax) = nmax;
nneg(nneg<nmin) = nmin;

plot(v,n,'r.-');
hold on
plot(v,nneg,'r.-');
plot(ones(1,101)*vmax,linspace(nmin,nmax,101),'r-')
hold off

axis([0 210 -1.5 3])
grid on
title('Flight Envelope of Executive Jet Aircraft')
xlabel('Airspeed (m/s)')
ylabel('load factor (-)')