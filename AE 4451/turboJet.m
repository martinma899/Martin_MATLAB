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
M = 0.7
Ta = 288
Pa = 101300
Pe = Pa

% engine design parameters
P03overP02 = 12
T04 = 3000
Qr = 45000e3

% losses
P04overP03 = 1
itad = 0.97
itac = 0.85
itab = 1
itat = 0.9
itan = 0.98

fprintf('----------------Inlet and diffuser:--------------\n\n')

u = M*sqrt(r*R*Ta) % convert between Mach and velocity
T02overTa = (1+(r-1)/2*M^2) % the robust non-isentropic T mach relation
T02soverTa = 1+itad*(T02overTa-1) % definition of itad
P02overPa = (T02soverTa)^(rd/(rd-1)) % isentropic P-T relation
T02 = T02overTa*Ta
P02 = P02overPa*Pa
T02s = T02soverTa*Ta

fprintf('----------------Compressor quantities:--------------\n\n')

T03soverT02 = (P03overP02)^((rc-1)/rc) % isentropic P-T relation
T03overT02 = 1/itac*(T03soverT02-1)+1 % definition of itac
T03 = T03overT02*T02
P03 = P03overP02*P02 % compression ratio is given
T03s = T03soverT02*T02

fprintf('----------------Burner quantities:--------------\n\n')

T04overT03 = T04/T03 % see the combustion heating
P04 = P04overP03*P03

fprintf('----------------Turbine quantities:--------------\n\n')

T04 = T04
T05 = T04-(T03-T02) % Find T05 by work transfer through central shaft. Estimate. 
T05overT04 = T05/T04
T05soverT04 = 1-itat*(1-T05overT04) % definition of itat
P05overP04 = (T05soverT04)^(rt/(rt-1)) % isentropic P-T relation
P05 = P05overP04*P04
T05s = T05soverT04*T04

fprintf('----------------No afterburner for now:--------------\n\n')

T06 = T05
P06 = P05

fprintf('----------------Nozzle and exit quantities:--------------\n\n')

PeoverP06 = Pe/P06
T07 = T06 % nozzle is adiabatic. T0 never changes except in burner
T7soverT07 = (PeoverP06)^((rn-1)/rn) % adiabatic P-T relation
T7s = T7soverT07*T07
T7 = T07-itan*(T07-T7s) % definition of itan
ue = sqrt(2*Cpn*itan*(T07-T7s)) % definition of stagnation at 7

fprintf('----------------Performance parameters:--------------\n\n')

f = (Cpb*T04-Cpc*T03)/(itab*Qr-Cpb*T04) % compute f from desired T4 and known T3
Tpermdota = (1+f)*ue-u
TSFC = f/Tpermdota
itap = Tpermdota*u/((1+f)*ue^2/2-u^2/2)
itap_estimate = (2*u/ue)/(1+u/ue)
itat = ((1+f)*ue^2/2-u^2/2)/(f*itab*Qr)
itatot = itap*itat
%itatot = Tpermdota*u/(f*itab*Qr)
