clc;clear

% universal constants
R = 287;
rc = 1.4;
rt = 1.33;
rn = 1.35;
Cpc = 1004;
Cpt = 1168;
Cpn = 1113;
Tref = 288;
Pref = 101300;

% efficiencies
itapc = 0.9; % polytropic efficiency of compressor (assume constant)
itapt = 0.9; % polytropic efficiency of turbine (assume constant)
itab = 0.99; % burner efficiency (assume constant)
itas = 0.995; % shaft efficiency (assume constant)

% pressure losses
Prd = 0.98; % diffuser pressure loss (on design)
Prdod = 0.995; % diffuser pressure loss (off design)
Prb = 0.98; % burner pressure loss (assume constant)
Prn = 0.97; % nozzle pressure loss (assume constant)

% design
% 1
T1 = 288 % known
T01 = T1 % known
Minf = 0 % takeoff
P1 = 1e5 % known
P01 = P1 % known
% diffuser
% 2
Mz2 = 0.6 % known
T02 = T01 % Assume adiabatic nozzle
P02 = Prd*P01 % Known P02
% compressor
Prc = 25 % known
mdotc2 = 73 
mdot2 = mdotc2*P02/Pref/sqrt(T02/Tref)
Nc2 = 6000
N = Nc2*sqrt(T02/Tref)
Trc = Prc^((rc-1)/(rc*itapc))
% 3 
P03 = P02*Prc
T03 = T02*Prc^((rc-1)/(rc*itapc))
% burner
HV = 42.8e6
% 4
T04 = 1773
P04 = P03*Prb
TP = T04/T02
% turbine
% 5
T05 = T04-Cpc/(Cpt*itas)*(T03-T02)
P05 = P04*(T05/T04)^(rt/((rt-1)*itapt))
% nozzle
% e
Pe = P1
P0e = P05*Prn
T0e = T05
Te = T0e*(Pe/P0e)^((rn-1)/rn)
ue = sqrt(2*Cpn*T0e*(1-Te/T0e))
u = Minf*sqrt(rc*R*T1)
tau = mdot2*(ue-u)

on_design_TP_list_label = ...
  {'T1' 'P1' 'T01' 'P01' 'T02' 'P02' 'T03' 'P03' ...
  'T04' 'P04' 'T05' 'P05' 'Te' 'Pe' 'T0e' 'P0e'}';
on_design_TP_list_numbers = ...
  {T1 P1 T01 P01 T02 P02 T03 P03 T04 P04 T05 P05 Te Pe T0e P0e}';
on_design_TP_list_comments = ...
  {'Given' 'Given' 'Computed from M1' 'Computed from M1' 'T02 = T01'...
   'Computed from diffuser pressure loss' ...
   'Computed from P-T relation with polytropic efficiency' ...
   'Compute from given compressions ratio'...
   'Given' 'Computed from burner pressure loss'...
   'Computed from energy transfer to compressor'...
   'Computed from P-T relation with polytropic efficiency'...
   'Computed from P-T relation, T0e, P0e and Pe'...
   'Pe = P1' 'T0e = T05' 'Computed from nozzle pressure loss'}';
on_design_TP_list = [on_design_TP_list_label ...
  on_design_TP_list_numbers on_design_TP_list_comments]

% on_design_Pratio_list_label = 



% off design parameters
% cruising at altitude
T1od = 258 % given
Minfod = 0.8 % given
T01od = T1od*(1+(rc-1)/2*Minfod^2) % compute T01od
T02od = T01od % T02od is the same
P1od = 33e3 
P01od = P1od*(1+(rc-1)/2*Minfod^2)^(rc/(rc-1))
P02od = P01od*Prdod
T04od = 1648
uod = Minfod*sqrt(rc*R*T1od)
TPod = T04od/T02od
Trcod = 1+TPod/TP*(Trc-1)
Prcod = Trcod^(rc*itapc/(rc-1))
mdotc2od = mdotc2*Prcod/Prc*sqrt(TP)/sqrt(TPod)
mdot2od = mdotc2od*P02od/Pref/sqrt(T02od/Tref)
Nc2od = Nc2*sqrt(TPod/TP)
Nod = N*sqrt(T04od/T04)
T05od = T05/T04*T04od
P05od = P02od*Prcod*Prb*(P05/P04)












