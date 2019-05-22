clc;clear

%slug-ft-s system

m = 10/32.174
mw = 60.1/32.174
gamma = 1.23
Runi = 1545.349
Rspec = Runi/mw
Cv = Rspec/0.23
Cp = 1.23*Cv
P1 = 2*14.6959*144
P2 = 3*P1
T1 = 599.67
T2 = T1*P2/P1
deltaT = T2-T1
deltaU = m*Cv*deltaT
deltaH = 1.23*deltaU
V = m*Rspec*T1/P1
deltaP = P2-P1
W = V*deltaP
deltaH-deltaU