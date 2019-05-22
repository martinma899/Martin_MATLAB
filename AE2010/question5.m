clc;clear

% all SI units. kg-N-m-s

Runi = 8.3144598;
mwch4 = 16.04e-3;
Rspec = Runi/mwch4;

m = 525;

T1 = 120;
P1 = 2.5e6;
rho1 = 412.42;
V1 = m/rho1

T2 = 120;
P2 = 0.5e6;
rho2 = 410.25;
V2 = m/rho2

fracchange = abs(V2-V1)/V1

Ttable = 100:5:150;
rhotable = [440.74 433.92 426.94 419.78 412.42 404.81 396.93 388.72 380.12 371.04 361.37];
plot(Ttable,rhotable,'bo')
hold on
plot(Ttable,rhotable,'r-')
title('T-rho behavior of methane')
xlabel('T/K')
ylabel('density/SI unit')

rho3 = rho2
T3 = interp1(rhotable,Ttable,rho3,'spline')

deltah1 = (23.945e3-28.599e3)+(5e6/415-0.5e6/410.25)
deltah2 = (44.026e3-26.465e3)+2.5e6*(1/404.81-1/412.42)