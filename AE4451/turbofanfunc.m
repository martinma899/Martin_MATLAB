function [out] = turbofanfunc (in)

% ideal gas parameters
% r's are gammas here. 
R = in.R;
r = in.r; % freestream
rd = in.rd; % diffuser
rf = in.rf; % fan
rc = in.rc; % compressor
rb = in.rb; % burner
rt = in.rt; % turbine
rn = in.rn; % nozzle
Cp = in.Cp;

% ambient conditions
M = in.M;
Ta = in.Ta;
Pa = in.Pa;
Pe = in.Pe;

% engine design parameters
P03overP02 = in.P03overP02; % compressor ratio
P08overP02 = in.P08overP02; % fan compression ratio
B = in.B; % bypass ratio
T04 = in.T04; % max combustion temperature
Qr = in.Qr; % energy content of fuel

% loss parameters
P04overP03 = in.P04overP03; % burner P0 loss
itad = in.itad; % common diffuser adiabatic efficiency
itaf = in.itaf; % fan adiabatic efficiency
itafn = in.itafn; % fan nozzle adiabatic efficiency
itac = in.itac; % compressor adiabatic efficiency
itab = in.itab; % burner heat efficiency
itat = in.itat; % turbine efficiency
itan = in.itan; % nozzle efficiency

% fprintf('---------------- Common diffuser: --------------\n\n')

u = M*sqrt(r*R*Ta); % convert between Mach and velocity
T02overTa = (1+(r-1)/2*M^2); % the robust non-isentropic T mach relation
T02soverTa = 1+itad*(T02overTa-1); % definition of itad
P02overPa = (T02soverTa)^(rd/(rd-1)); % isentropic P-T relation
T02 = T02overTa*Ta;
P02 = P02overPa*Pa;
T02s = T02soverTa*Ta;

% fprintf('---------------- Fan: --------------\n\n')

P08 = P08overP02*P02; % fan compression
T08soverT02 = (P08overP02)^((rf-1/rf)); % isentropic P-T relation
T08overT02 = 1/itaf*(T08soverT02-1)+1; % definition of fan adiabatic efficiency
T08 = T08overT02*T02;
T08s = T08soverT02*T02;

% fprintf('---------------- Fan Nozzle: --------------\n\n')

PeoverP08 = Pe/P08;
T8soverT08 = (PeoverP08)^((rf-1)/rf); % adiabatic P-T relation
T8s = T8soverT08*T08;
T8 = T08-itafn*(T08-T8s); % definition of itan
uef = sqrt(2*Cp*itafn*(T08-T8s)); % definition of stagnation at 7

% fprintf('---------------- Compressor: --------------\n\n')

T03soverT02 = (P03overP02)^((rc-1)/rc); % isentropic P-T relation
T03overT02 = 1/itac*(T03soverT02-1)+1; % definition of itac
T03 = T03overT02*T02;
P03 = P03overP02*P02; % compression ratio is given
T03s = T03soverT02*T02;

% fprintf('---------------- Burner: --------------\n\n')

T04overT03 = T04/T03; % see the combustion heating
P04 = P04overP03*P03;

% fprintf('---------------- Turbine: --------------\n\n')

T04 = T04;
T05 = T04-(T03-T02)-B*(T08-T02); % Find T05 by work transfer through central shaft. Estimate. 
T05overT04 = T05/T04;
T05soverT04 = 1-itat*(1-T05overT04); % definition of itat
P05overP04 = (T05soverT04)^(rt/(rt-1)); % isentropic P-T relation
P05 = P05overP04*P04;
T05s = T05soverT04*T04;

% fprintf('---------------- no afterburner for now: --------------\n\n')

T06 = T05;
P06 = P05;

% fprintf('---------------- nozzle: --------------\n\n')

PeoverP06 = Pe/P06;
T07 = T06; % nozzle is adiabatic. T0 never changes except in burner
T7soverT07 = (PeoverP06)^((rn-1)/rn); % adiabatic P-T relation
T7s = T7soverT07*T07;
T7 = T07-itan*(T07-T7s); % definition of itan
ue = sqrt(2*Cp*itan*(T07-T7s)); % definition of stagnation at 7

% fprintf('---------------- Performance parameters: --------------\n\n')

f = (T04overT03-1)/((itab*Qr/(T03*Cp))-T04overT03); % compute f from desired T4 and known T3
Tpermdota = (1+f)*ue+B*uef-u*(1+B);
TSFC = f/Tpermdota;
itap = Tpermdota*u/((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2);
itap_estimate = (2*u/ue)/(1+u/ue);
itat = ((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2)/(f*itab*Qr);
itatot = itap*itat;
%itatot = Tpermdota*u/(f*itab*Qr);

% write variable to output struct

out.u = u;
out.T02overTa = T02overTa;
out.T02soverTa = T02soverTa;
out.P02overPa = P02overPa;
out.T02 = T02;
out.P02 = P02;
out.T02s = T02s;
out.P08 = P08;
out.T08soverT02 = T08soverT02;
out.T08overT02 = T08overT02;
out.T08 = T08;
out.T08s = T08s;
out.PeoverP08 = PeoverP08;
out.T8soverT08 = T8soverT08;
out.T8s = T8s;
out.T8 = T8;
out.uef = uef;
out.T03soverT02 = T03soverT02;
out.T03overT02 = T03overT02;
out.T03 = T03;
out.P03 = P03;
out.T03s = T03s;
out.T04overT03 = T04overT03;
out.P04 = P04;
out.T05 = T05; 
out.T05overT04 = T05overT04;
out.T05soverT04 = T05soverT04;
out.P05overP04 = P05overP04;
out.P05 = P05;
out.T05s = T05s;
out.T06 = T06;
out.P06 = P06;
out.PeoverP06 = PeoverP06;
out.T07 = T07;
out.T7soverT07 = T7soverT07;
out.T7s = T7s;
out.T7 = T7;
out.ue = ue;
out.f = f;
out.Tpermdota = Tpermdota;
out.TSFC = TSFC;
out.itap = itap;
out.itap_estimate = itap_estimate;
out.itat = itat;
out.itatot = itatot;
