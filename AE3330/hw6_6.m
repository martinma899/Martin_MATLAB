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
T0max = 55620;

hvec = linspace(0,2500,101);
rhovec = density(hvec);
Tvec = (rhovec./rho0).^0.6*T0max;

xg = 1.21/g*(1./rhovec*(m*g/s)*1/clmax*m*g./Tvec);

figure (1)
hold on
plot(hvec,xg,'k.-')
hold off
grid on
xlabel('altitude (m)')
ylabel('groundroll (m)')
title('Groundroll distance vs. altitude for Executive Jet')



clmaxvec = linspace(1.5,3.5,101);
xg = 1.21/g*(1/rho0*(m*g/s)*1./clmaxvec*m*g./T0max);

figure(2)
hold on
plot(clmaxvec,xg,'k.-')
hold off
grid on
xlabel('CLmax (-)')
ylabel('groundroll (m)')
title('Groundroll distance vs. CLmax for Executive Jet')


mg = linspace(200e3,400e3,101);
xg = 1.21/g*(1/rho0*(mg/s).*1/clmax.*mg/T0max);

figure(3)
hold on
plot(mg/1000,xg,'k.-')
hold off
grid on
xlabel('Weight (kN)')
ylabel('groundroll (m)')
title('Groundroll distance vs. Weight for Executive Jet')

