clc;clear

dab = 3.5;
dbc = 2.75;
dcd = 2.5;
Tb = 12.5e3;
Tc = 9.8e3;
Td = 9.2e3;
G = 11.6e6;
l = 25;

Ipcd = pi/32*dcd^4;
taucdmax = Td*dcd/2/(Ipcd)
phicd = Td*l/(G*Ipcd)
Ipbc = pi/32*dbc^4;
taubcmax = (Td+Tc)*dbc/2/(Ipbc)
phibc = (Td+Tc)*l/(G*Ipbc)
Ipab = pi/32*dab^4;
tauabmax = (Td+Tc+Tb)*dab/2/(Ipab)
phiab = (Td+Tc+Tb)*l/(G*Ipab)

taumax = taubcmax
phitotal = phiab+phibc+phicd

dcdn = (16/pi*Td/taumax)^(1/3)
dbcn = (16/pi*(Td+Tc)/taumax)^(1/3)
dabn = (16/pi*(Td+Tc+Tb)/taumax)^(1/3)

Ipcdn = pi/32*dcdn^4;
phicdn = Td*l/(G*Ipcdn)
Ipbcn = pi/32*dbcn^4;
phibcn = (Td+Tc)*l/(G*Ipbcn)
Ipabn = pi/32*dabn^4;
phiabn = (Td+Tc+Tb)*l/(G*Ipabn)
phintotal = phiabn+phibcn+phicdn