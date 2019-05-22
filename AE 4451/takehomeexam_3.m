clc;clear

rhos = 1800;
P0 = 1500;
rdot = 0.007*P0^0.5/100
T0 = 1690;
MW = 24;
Rbar = 8314;
R = Rbar/MW
r = 1.24;

cstar_ideal = sqrt(1/r*((r+1)/2)^((r+1)/(r-1))*R*T0)
Ct = 1.7;
Finert = 50/150;
ge = 9.8;
deltau = 2000;

Isp = Ct*cstar_ideal/ge
quantity = deltau/(ge*log(1/Finert))

P0pa = P0*6894.75729
rho0 = P0pa/(R*T0)
T = 4000;

Ab = T/(rdot*(rhos-rho0)*cstar_ideal*Ct)