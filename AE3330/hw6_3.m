clc;clear

m = 33100;
s = 88.2;
rho = density(3000);
rho0 = density(0);
cd0 = 0.015;
K = 0.05;
g = 9.81;
T0max = 55620;

v = linspace(40,300,101);

Treq1 = 0.5*rho*s*v.^2*cd0+2*K*(m*g)^2/(rho*s*cosd(15)^2)*1./v.^2;
Treq2 = 0.5*rho*s*v.^2*cd0+2*K*(m*g)^2/(rho*s*cosd(45)^2)*1./v.^2;
Tav = (rho/rho0)^0.6*T0max;

plot(v,Treq1/1000,'b.-');
hold on
plot(v,Treq2/1000,'k.-');
plot(v,ones(1,101)*Tav/1000,'r')
hold off
axis([40 300 0 18e1])
grid on
title('Thrust required at various air speeds for two bank angles')
ylabel('Thrust (kN)')
xlabel('Airspeed (m/s)')
legend('Bank angle = 15 degrees','Bank angle = 45 degrees','Available Thrust')

