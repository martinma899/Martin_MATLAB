clc;clear

% ideal gas parameters
% r's are gammas here. 
R = 287
r = 1.4 % freestream
rd = 1.4 % diffuser
rf = 1.4 % fan
rc = 1.37 % compressor
rb = 1.35 % burner
rt = 1.33 % turbine
rn = 1.36 % nozzle
Cp = R/(1-1/r)
Cpc = R/(1-1/rc)
Cpb = R/(1-1/rb)
Cpn = R/(1-1/rn)

% ambient conditions
M = 0.85
Ta = 216.7
Pa = 18.75e3
Pe = Pa

% engine design parameters
P03overP02 = 30 % compressor ratio
P08overP02 = 1.5 % fan compression ratio
B = 5 % bypass ratio
T04 = 1700 % max combustion temperature
Qr = 45000e3 % energy content of fuel

% loss parameters
P04overP03 = 1 % burner P0 loss
itad = 0.97 % common diffuser adiabatic efficiency
itaf = 0.85 % fan adiabatic efficiency
itafn = 0.97 % fan nozzle adiabatic efficiency
itac = 0.85 % compressor adiabatic efficiency
itab = 1 % burner heat efficiency
itat = 0.9 % turbine efficiency
itan = 0.98 % nozzle efficiency

fprintf('---------------- Common diffuser: --------------\n\n')

u = M*sqrt(r*R*Ta) % convert between Mach and velocity
T02overTa = (1+(r-1)/2*M^2) % the robust non-isentropic T mach relation
T02soverTa = 1+itad*(T02overTa-1) % definition of itad
P02overPa = (T02soverTa)^(rd/(rd-1)) % isentropic P-T relation
T02 = T02overTa*Ta
P02 = P02overPa*Pa
T02s = T02soverTa*Ta

fprintf('---------------- Fan: --------------\n\n')

P08 = P08overP02*P02 % fan compression
T08soverT02 = (P08overP02)^((rf-1/rf)) % isentropic P-T relation
T08overT02 = 1/itaf*(T08soverT02-1)+1 % definition of fan adiabatic efficiency
T08 = T08overT02*T02
T08s = T08soverT02*T02

fprintf('---------------- Fan Nozzle: --------------\n\n')

PeoverP08 = Pe/P08
T8soverT08 = (PeoverP08)^((rf-1)/rf) % adiabatic P-T relation
T8s = T8soverT08*T08
T8 = T08-itafn*(T08-T8s) % definition of itan
uef = sqrt(2*Cpn*itafn*(T08-T8s)) % definition of stagnation at 7

fprintf('---------------- Compressor: --------------\n\n')

T03soverT02 = (P03overP02)^((rc-1)/rc) % isentropic P-T relation
T03overT02 = 1/itac*(T03soverT02-1)+1 % definition of itac
T03 = T03overT02*T02
P03 = P03overP02*P02 % compression ratio is given
T03s = T03soverT02*T02

fprintf('---------------- Burner: --------------\n\n')

T04overT03 = T04/T03 % see the combustion heating
P04 = P04overP03*P03

fprintf('---------------- Turbine: --------------\n\n')

T04 = T04
T05 = T04-(T03-T02)-B*(T08-T02) % Find T05 by work transfer through central shaft. Estimate. 
T05overT04 = T05/T04
T05soverT04 = 1-itat*(1-T05overT04) % definition of itat
P05overP04 = (T05soverT04)^(rt/(rt-1)) % isentropic P-T relation
P05 = P05overP04*P04
T05s = T05soverT04*T04

fprintf('---------------- no afterburner for now: --------------\n\n')

T06 = T05
P06 = P05

fprintf('---------------- nozzle: --------------\n\n')

PeoverP06 = Pe/P06
T07 = T06 % nozzle is adiabatic. T0 never changes except in burner
T7soverT07 = (PeoverP06)^((rn-1)/rn) % adiabatic P-T relation
T7s = T7soverT07*T07
T7 = T07-itan*(T07-T7s) % definition of itan
ue = sqrt(2*Cpn*itan*(T07-T7s)) % definition of stagnation at 7

fprintf('---------------- Performance parameters: --------------\n\n')

f = (Cpb*T04-Cpc*T03)/(itab*Qr-Cpb*T04) % compute f from desired T4 and known T3
Tpermdota = (1+f)*ue+B*uef-u*(1+B)
TSFC = f/Tpermdota
itap = Tpermdota*u/((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2)
itap_estimate = (2*u/ue)/(1+u/ue)
itat = ((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2)/(f*Qr)
itatot = itap*itat
%itatot = Tpermdota*u/(f*itab*Qr)
