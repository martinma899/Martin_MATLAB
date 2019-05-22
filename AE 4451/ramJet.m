clc;clear

fprintf('Input parameters: \n\n')

R = 287
r = 1.4
r2 = 1.3
Cp = R/(1-1/r)
Cp2 = R/(1-1/r2)

M = 2
Ta = 205
Pa = 11.6e3
Pe = Pa

%T4max = 3000;
%M4 = 0.5;
%T04 = T4max*(1+(r2-1)/2*M4^2)
T04 = 3000

rd = 1-0.1*(M-1)^1.5
rc = 0.97*0.95
rn = 1
itab = 0.98
itan = 0.95
%burnerP0Ratio = 0.97*0.95

Qr = 45000e3
mdota = 1
Ae = 0


fprintf('----------------Inlet and diffuser:--------------\n\n')

fprintf('Mach number: %1.10f\n\n',M)

u = M*sqrt(r*R*Ta)
P0aoverPa = (1+(r-1)/2*M^2)^(r/(r-1))
T0aoverTa = (1+(r-1)/2*M^2)
P0a = Pa*P0aoverPa
T0a = Ta*T0aoverTa


fprintf('----------------Combustion P0 loss:--------------\n\n')
P06overP0a = rd*rc*rn
P06 = P0a*P06overP0a

%f = 1/15
%T04 = (Cp*T0a+itab*Qr*f)/((1+f)*Cp2)

fprintf('----------------Exit conditions:--------------\n\n')
PaoverPe = Pa/Pe
Me = sqrt(2/(r2-1)*((P06overP0a*P0aoverPa*PaoverPe)^((r2-1)/r2)-1))
Te = T04/(1+(r2-1)/2*Me^2)
%ue = Me*sqrt(r2*R*Te)
ue = sqrt(2*itan*Cp2*(T04-Te))


fprintf('----------------performance parameters:--------------\n\n')
f = (Cp*T0a-Cp2*T04)/(Cp2*T04-itab*Qr)
%m = (1+(r-1)/2*M^2)*(rd*rc*rn*Pa/Pe)^((r-1)/r);
%Tpermdota = (1+f)*sqrt(2*r*R*T04*(m-1)/((r-1)*m))...
%  -M*sqrt(r*R*Ta)+Pe*Ae/mdota*(1-Pa/Pe)
Tpermdota = (1+f)*ue-u+(Pe*Ae/mdota*(1-Pa/Pe))
TSFC = f/Tpermdota
itap = Tpermdota*u/((1+f)*ue^2/2-u^2/2)
itap_estimate = (2*u/ue)/(1+u/ue)
%itat = ((1+f)*ue^2/2-u^2/2)/(f*Qr)
itat = ((1+f)*ue^2/2-u^2/2)/(f*itab*Qr)
itatot = itap*itat
%itatot = Tpermdota*u/(f*itab*Qr)



