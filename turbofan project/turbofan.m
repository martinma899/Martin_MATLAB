optimize = true;
if ~optimize
  clc
  close all
  clear
  optimize = false;
  design = 'cruise'; % takeoff, cruise, both
  nozzleMix = true;
end

%fprintf('---------------- Gas constant and ratios: --------------\n\n')

% r's are gammas here.
R = 8314/29;
r = 1.4; % freestream
rd = 1.4; % diffuser
rf = 1.4; % fan
rc = 1.38; % compressor
rb = 1.32; % burner
rt = 1.33; % HP turbine
rtm = 1.34; % turbine mixer
rft = 1.34; % LP turbine

rn = 1.37; % core nozzle
rfn = 1.4; % fan nozzle
rnm = 1.38; % nozzle mixer
rcn = 1.38; % combined nozzle

%fprintf('---------------- Ambient conditions: --------------\n\n')

if ~optimize
  switch design
    case 'takeoff'
      takeoff = true;
    case 'cruise'
      takeoff = false;
    case 'both'
      takeoff = false;
  end
end

if ~takeoff
  % for cruise
  M = 0.85;
  Ta = 218.8;
  Pa = 23.9e3;
  
else
  % for takeoff
  M = 0;
  Ta = 288.2;
  Pa = 101.3e3;
end
%fprintf('---------------- Design parameters, variable: --------------\n\n')
if ~optimize
  switch design
    case 'cruise'
      % for cruise
      B = 7.29198885694159; % fan bypass ratio
      b = 0.1; % cooling bleed ratio
      Prc = 50; % compressor ratio
      Prf = 2; % fan compression ratio
    case 'takeoff'
      % for takeoff
      B = 12; % fan bypass ratio
      b = 0.1; % cooling bleed ratio
      Prc = 48.7433807342179; % compressor ratio
      Prf = 1.58721655786557; % fan compression ratio
    case 'both'
      % both
      B = 8.16375303507399; % fan bypass ratio
      b = 0.1; % cooling bleed ratio
      Prc = 38.5714285714254; % compressor ratio
      Prf = 2; % fan compression ratio
  end
end
%fprintf('---------------- Design parameters, fixed: --------------\n\n')

bmax = 0.12; % max cooling bleed ratio
Cb1 = 650; % HP turbine cooling factor
Cb2 = 2000e3; % bleed P0 loss coefficient
CB1 = 0.245e3; % drag factor
CB2 = 0.02; % Mixed nozzle P0 loss coefficient
Tmax0 = 1200; % max combustion temperature without cooling
Qr = 45.4e6; % energy content of fuel
if takeoff
  Treq = 375.3e3; % required thrust
else
  Treq = 69.2e3; % required thrust
end

%fprintf('---------------- Efficiency and loss: --------------\n\n')
itad = 0.98; % common diffuser adiabatic efficiency
itaf_p = 0.93; % fan polytropic efficiency
itac_p = 0.91; % compressor polytropic efficiency
itab = 0.99; % burner heat efficiency
itat_p = 0.93; % HP turbine polytropic efficiency
itaft_p = 0.93; % LP turbine polytropic efficiency
itan = 0.95; % core nozzle efficiency
itafn = 0.97; % fan nozzle adiabatic efficiency
itacn = 0.95; % combined nozzle adiabatic efficiency
Prb = 0.99; % burner P0 loss
if B>=5
  Prm = 1; % bleed air vent P0 loss
else
  Prm = 1-B*(5-B)/6.25*CB2;
end
%fprintf('---------------- Common diffuser: --------------\n\n')

u = M*sqrt(r*R*Ta); % convert between Mach and velocity
T02overTa = (1+(r-1)/2*M^2); % the robust non-isentropic T mach relation
T02soverTa = 1+itad*(T02overTa-1); % definition of itad
P02overPa = (T02soverTa)^(rd/(rd-1)); % isentropic P-T relation
T02 = T02overTa*Ta;
P02 = P02overPa*Pa;
T02s = T02soverTa*Ta;

%fprintf('---------------- Fan: --------------\n\n')

% compute adiabatic efficiency from polytropic efficiency
itaf = (Prf^((rf-1)/rf)-1)/(Prf^((rf-1)/(rf*itaf_p))-1);
T03soverT02 = (Prf)^((rf-1)/rf); % isentropic P-T relation
T03overT02 = 1/itaf*(T03soverT02-1)+1; % definition of fan adiabatic efficiency
T03 = T03overT02*T02;
P03 = Prf*P02; % fan compression
T03s = T03soverT02*T02;

%fprintf('---------------- Compressor: --------------\n\n')

% compute adiabatic efficiency from polytropic efficiency
itac = (Prc^((rc-1)/rc)-1)/(Prc^((rc-1)/(rc*itac_p))-1);
T04soverT03 = (Prc)^((rc-1)/rc); % isentropic P-T relation
T04overT03 = 1/itac*(T04soverT03-1)+1; % definition of itac
T04 = T04overT03*T03; % compute T04
P04 = Prc*P03; % compute P04
T04s = T04soverT03*T03; % compute T04s

%fprintf('---------------- Burner: --------------\n\n')

T05 = Tmax0+Cb1*sqrt(b/bmax); % Assume T05 is maximum temperature possible
T05overT04 = T05/T04; % see the combustion heating ratio
P05 = Prb*P04; % compute P05 from estimated combustion pressure loss
f = (1-b)*(T04*rc/(rc-1)-T05*rb/(rb-1))...
  /(T05*rb/(rb-1)-itab*Qr/R);

%fprintf('---------------- HP Turbine: --------------\n\n')

% Compute T05 by work transfer through HP turbine - compressor shaft.
T06 = T05+1/(1+f-b)*((rt-1)/rt)*(rc/(rc-1))*(T03-T04) ;
T06overT05 = T06/T05; % compute T06overT05

% compute adiabatic efficiency from polytropic efficiency
itat = (T06overT05-1)/(T06overT05^(1/itat_p)-1);

T06soverT05 = 1-1/itat*(1-T06overT05); % definition of itat
P06overP05 = (T06soverT05)^(rt/(rt-1)); % isentropic P-T relation
P06 = P06overP05*P05; % compute P06
T06s = T06soverT05*T05; % compute T06s

%fprintf('---------------- Turbine Mixer: --------------\n\n')

% T07 is mass flow weighed average after mixing
T07 = (b*T04+(1-b+f)*T06)/((1+f));
T07overT06 = T07/T06;
% Denote P04_ as P0 in bleed vent after pressure drop
P04_ = P04-Cb2*b;
% Compupte P07 via gibbs equation and entropy conservation
P07overP06 = (T07/T06)^(rtm/(rtm-1))*(P04_/P06)^(b/(1+f))...
  *(T06/T04)^(b/(1+f)*rtm/(rtm-1));
P07 = P07overP06*P06;


%fprintf('---------------- LP Turbine: --------------\n\n')

% Compute T05 by work transfer through LP turbine - fan shaft.
T08 = T07-B/(1+f)*(rf/(rf-1))*((rft-1)/rft)*(T03-T02);
T08overT07 = T08/T07; % compute T08overT07

% compute adiabatic efficiency from polytropic efficiency
itaft = (T08/T07-1)/((T08/T07)^(1/itaft_p)-1);

T08soverT07 = 1-1/itaft*(1-T08overT07); % definition of itaft
P08overP07 = T08soverT07^(rft/(rft-1)); % isentropic P-T relation
P08 = P08overP07*P07; % compute P08
T08s = T08soverT07*T07; % compute T08s

if ~nozzleMix
  %fprintf('---------------- core nozzle: --------------\n\n')
  
  T09 = T08;
  PaoverP08 = Pa/P08;
  T9soverT08 = (PaoverP08)^((rn-1)/rn); % adiabatic P-T relation
  T9s = T9soverT08*T08;
  T9overT08 = 1-itan*(1-T9soverT08); % definition of itan
  T9 = T9overT08*T08;
  
  if T09-T9<=0||T09<=0||T9<=0
    energyLow = true;
  else
    energyLow = false;
  end
  ue = sqrt(2*rn*R/(rn-1)*(T09-T9)); % definition of stagnation at 7
  
  
  %fprintf('---------------- Fan Nozzle: --------------\n\n')
  
  PaoverP03 = Pa/P03;
  T10soverT03 = (PaoverP03)^((rfn-1)/rfn); % adiabatic P-T relation
  T10s = T10soverT03*T03;
  T10overT03 = 1-itafn*(1-T10soverT03);
  T10 = T10overT03*T03; % definition of itan
  T010 = T03;
  uef = sqrt(2*rfn*R/(rfn-1)*(T010-T10)); % definition of stagnation at 7
else
  %fprintf('---------------- nozzle mixer: --------------\n\n')
  
  % T09 is mass flow weighed average after mixing
  T09 = ((1+f)*T08+B*T03)/((1+f+B));
  % Compupte P09_ via gibbs equation and entropy conservation
  P09_ = ((T09/T03)^(B*rnm/(rnm-1))*(T09/T08)^((1+f)*rnm/(rnm-1))...
    *P03^B*P08^(1+f))^(1/(1+f+B));
  
  %P09_ = P08*(P03/P08)^(B/(1+B+f))*(T09/T08)^(rnm/(rnm-1))*(T08/T03)^(B/(1+B+f)*rnm/(rnm-1))
  P09 = P09_*Prm;
  
  %fprintf('---------------- Combined Nozzle: --------------\n\n')
  PaoverP09 = Pa/P09;
  T10soverT09 = (PaoverP09)^((rcn-1)/rcn); % adiabatic P-T relation
  T10s = T10soverT09*T09;
  T10overT09 = 1-itacn*(1-T10soverT09);
  T10 = T10overT09*T09; % definition of itan
  T010 = T09;
  if T09-T10<=0||T09<=0||T10<=0
    energyLow = true;
  else
    energyLow = false;
  end
  
  ue = sqrt(2*rcn*R/(rcn-1)*(T010-T10)); % definition of stagnation at 7
  
end

%fprintf('---------------- Performance parameters: --------------\n\n')

if energyLow
  Tpermdota = 0;
  Tpermdotaeff = 0;
  deltad = 0;
  Tpermdotaeff = 0;
  mdotareq = 0;
  mdottotreq = 0;
  rhoa = Pa/(R*Ta);
  Aengine = 0;
  Aall = 0;
  Dall = 0;
  Prtotal = Prc*Prf;
  TSFC = 0;
  TSFCeff = 0;
  itap = 0;
  itaq = 0;
  ita = 0;
else
  if nozzleMix
    Tpermdota = (1+f+B)*ue-(1+B)*u;
    itap = Tpermdota*u/((1+f+B)*ue^2/2-(1+B)*u^2/2);
    itaq = ((1+f+B)*ue^2/2-(1+B)*u^2/2)/(f*Qr);
  else
    Tpermdota = (1+f)*ue+B*uef-u*(1+B);
    itap = Tpermdota*u/((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2);
    itaq = ((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2)/(f*Qr);
  end
  if takeoff
    ita = itaq;
  else
    ita = itap*itaq;
  end
  TSFC = f/Tpermdota;
  deltad = CB1*M^2*Pa/101.3e3*B^(3/2);
  Tpermdotaeff = Tpermdota-deltad;
  if Tpermdotaeff<=0
    Tpermdotaeff = 0;
    TSFCeff = 0;
  else
    if nozzleMix
      itapeff = Tpermdotaeff*u/((1+f+B)*ue^2/2-(1+B)*u^2/2);
      itaqeff = ((1+f+B)*ue^2/2-(1+B)*u^2/2)/(f*Qr);
    else
      itapeff = Tpermdotaeff*u/((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2);
      itaqeff = ((1+f)*ue^2/2+B*uef^2/2-(1+B)*u^2/2)/(f*Qr);
    end
    TSFCeff = f/Tpermdotaeff;
    if takeoff
      itaeff = itaqeff;
    else
      itaeff = itapeff*itaqeff;
    end
  end
  
  PowerComp = R*rc/(rc-1)*(T04-T03);
  PowerFan = B*R*rf/(rf-1)*(T03-T02);
  PowerHPturbine = (1+f-b)*R*rt/(rt-1)*(T05-T06);
  PowerLPturbine = (1+f)*R*rft/(rft-1)*(T07-T08);
  
  mdotareq = Treq/Tpermdotaeff;
  mdottotreq = mdotareq*(1+B);
  rhoa = Pa/(R*Ta);
  Aengine = mdotareq/(rhoa*u);
  Aall = Aengine*(1+B);
  Dall = 2*sqrt(Aall/pi);
  Prtotal = Prc*Prf;
end

