clc;clear

minit = 1000;
Isp = 300;
g = 9.81;
e = 0.2;
a = 10000e3;
mew = 398600e9;

% option 1
disp('option 1')

Vp_init = sqrt(mew*(1+e)/(a*(1-e)))

Vtrasfer = sqrt(mew/(a*(1-e)))

deltaV1 = sqrt(mew/(a*(1-e)))*(sqrt(1+e)-1)

deltaV2 = deltaV1

mprop1 = minit*(1-exp(-deltaV1/(g*Isp)))

mtransfer = minit-mprop1

mprop2 = mtransfer*(1-exp(-deltaV2/(g*Isp)))

mprop = mprop1+mprop2

% option 2
disp('option 2')

Va_init = sqrt(mew*(1-e)/(a*(1+e)))

Vtrasfer = sqrt(mew/(a*(1+e)))

deltaV1 = sqrt(mew/(a*(1+e)))*(1-sqrt(1-e))

deltaV2 = deltaV1

mprop1 = minit*(1-exp(-deltaV1/(g*Isp)))

mtransfer = minit-mprop1

mprop2 = mtransfer*(1-exp(-deltaV2/(g*Isp)))

mprop = mprop1+mprop2

% option 3
disp('option 3')

P = a*(1-e^2)

V_rectum = sqrt(mew*(2/P-1/a))

singamma = 1/sqrt(1+e^2)

gamma = asind(1/sqrt(1+e^2))

deltaV = 2*sqrt(mew*(2/(a*(1-e^2))-1/a))*sqrt(e^2/(1+e^2))

mprop = minit*(1-exp(-deltaV/(g*Isp)))