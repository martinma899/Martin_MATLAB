clc;clear

% gas constants
R = 287
r = 1.4
r2 = 1.3
Cp = R/(1-1/r)
Cp2 = R/(1-1/r2)

% ambient conditions
M = 2
Ta = 205
Pa = 11.6e3
Pe = Pa

% engine design parameters
T04 = 3000
Qr = 45000e3
mdota = 1 % mdota and Ae are for exit pressure thrust only
Ae = 0 % Ae = 0 will turn this off and assume Pe = Pa

% losses
% r's are p0 ratios  
rd = 1 % supersonic diffuser P0 loss
rb = 1 % burner P0 loss
rn = 1 % nozzle P0 loss
itab = 0.98 % burner efficiency
itan = 0.95 % nozzle efficiency

fprintf('----------------Supersonic diffuser:--------------\n\n')

u = M*sqrt(r*R*Ta) % find freestream velocity from M and Ta
P0aoverPa = (1+(r-1)/2*M^2)^(r/(r-1)) % isentropic P0a from Pa
T0aoverTa = (1+(r-1)/2*M^2) % T0a
P0a = Pa*P0aoverPa
T0a = Ta*T0aoverTa

fprintf('----------------Exit conditions:--------------\n\n')
P06overP0a = rd*rb*rn % directly get P06 after combustion
P06 = P0a*P06overP0a
PaoverPe = Pa/Pe
P06overPe = P06overP0a*P0aoverPa*PaoverPe
% use isentropic P ratio to find Me
Me = sqrt(2/(r2-1)*((P06overPe)^((r2-1)/r2)-1))
Te = T04/(1+(r2-1)/2*Me^2) % find Te from Me and T04
ue = sqrt(2*itan*Cp2*(T04-Te)) % find ue from exit T04 definition

fprintf('----------------performance parameters:--------------\n\n')
f = (Cp2*T04-Cp*T0a)/(itab*Qr-Cp2*T04)
Tpermdota = (1+f)*ue-u+(Pe*Ae/mdota*(1-Pa/Pe))
TSFC = f/Tpermdota
itap = Tpermdota*u/((1+f)*ue^2/2-u^2/2)
itap_estimate = (2*u/ue)/(1+u/ue)
itat = ((1+f)*ue^2/2-u^2/2)/(f*Qr)
itatot = itap*itat
%itatot = Tpermdota*u/(f*itab*Qr) % alternative 
