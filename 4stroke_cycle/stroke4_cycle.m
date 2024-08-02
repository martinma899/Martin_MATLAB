clc;clear

beta = 10.5; % compression ratio
afr = 14.04; % air fuel ratio
Esp = 46e6; % gasoline energy content, J/kg
R = 8.31446261815324; % gas constant, J/K
mma = 28.9647e-3; % air molecular weight, kg

s = 99e-3; % stroke, m
b = 87e-3; % bore, m
A = pi*(b/2)^2; % piston area, m2

% atmosphere
Ta = 288.15; % K
Pa = 10.13e4; % N/m2

% intake manifold
gamma0 = CpCvgamma(Ta);
P0 = Pa-22*3386.39
T0 = Ta*(P0/Pa)^((gamma0-1)/gamma0)

% intake stroke
V1 = s*(1+1/beta)*A
P1 = P0
T1 = T0
ma = P1*V1/R/T1*mma

% compression stroke
T2 = T1*beta^(gamma0-1)
V2 = V1/beta
P2 = P1*beta^gamma0

% ignition
V3 = V2
T3 = 4150
DeltaT = T3-T2
afr = Esp/(Cv(T2)*DeltaT)-1
P3 = T3/T2*P2
Q = ma/afr*Esp

% expansion
gamma4 = CpCvgamma(T3);
V4 = V1
T4 = T3*(1/beta)^(gamma4-1)
P4 = P3*(1/beta)^gamma4

% work extracted
Wlost = T4*(Cv((T4)/2)*ma*(1+1/afr))
W = Q-Wlost
% thermal efficiency
eta_t = W/Q

nc = 4; % number of cylinders
rpm = 6500; % rpm
P = W*nc/2*rpm/60 % power in watt
Ph = P/745.7 % power in horsepower
torque = Ph*5252/rpm % torque in ft-lb
