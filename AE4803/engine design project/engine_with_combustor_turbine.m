clear

% conditions
M = 0.8;
P1 = 24000;
T1 = 219;

% gas constants
R = 287; % air gas constant
r = 1.4; % air specific heat ratio
Cp = R/(1-1/r); % air Cp

MWb = 28.8; % burner product molecular weight
Runi = 8.3144598; % universal gas constant
Rb = Runi*1000/MWb; % burner product gas constant

rt = 1.29; % turbine specific heat ratio
rn = 1.35; % nozzle specific heat ratio
Cpt = Rb/(1-1/rt); % turbine Cp
Cpn = Rb/(1-1/rn); % nozzle Cp

% Engine Pressure Losses
Prd = 0.985; % Diffuser pressure loss is give
Prb = 0.9; % Burner pressure loss will depend on burner design

% Engine Efficieicies
itapc = 0.905; % compressor polytropic efficiency
itapt = 0.920; % turbine polytropic efficiency
itab = 0.98; % burner efficiency
itas = 0.99; % shaft mechanical efficiency
itan = 0.95; % nozzle adiabatic efficiency

% Design Requirements
mdot = 48; % engine mass flow rate
Prc = 18; % compressor pressure ratio
T04 = 1600; % burner exit temperature

% additional parameters
HV = 42.8e6; % heat value of fuel, from example OD engine problem

% (1) Diffuser inlet
T01 = T1*(1+(r-1)/2*M^2); % inlet stagnation temperature
P01 = P1*(1+(r-1)/2*M^2)^(r/(r-1)); % inlet stagnation pressure
u = M*sqrt(r*R*T1); % freestream velocity
rho1 = P1/(R*T1); % freestream density
A1 = mdot/(rho1*u); % diffuser face area

% (2) Compressor inlet
T02 = T01; % no work done, T0 remains the same
P02 = P01*Prd; % some stagnation pressure loss
M2 = 0.5; % design choice by Martin as suggested in ppt
T2 = T02/(1+(r-1)/2*M2^2); % find T2
P2 = P02/(1+(r-1)/2*M2^2)^(r/(r-1)); % find P2
cz = M2*sqrt(r*R*T2); % find axial velocity (no swirl component yet)
rho2 = P2/(R*T2); % find rho2 for sizing
A2 = mdot/(rho2*cz); % find A2

% (3) Compressor exit, burner diffuser inlet
T03 = T02*Prc^((r-1)/(r*itapc)); % T03 found via polytropic efficiency
P03 = P02*Prc; % P03 found via designed compressor pressure ratio
deltah0c = Cp*(T03-T02); % work done by compressor
T3 = T03-cz^2/(2*Cp); % find T3 from kinetic energy
M3 = cz/sqrt(r*R*T3); % find M3 
P3 = P03/(1+(r-1)/2*M3^2)^(r/(r-1)); % find P3
rho3 = P3/(T3*R); % find rho3
A3 = mdot/(rho3*cz); % find A3

% (4) Burner exit, turbine inlet
% T04 is known
P04 = P03*Prb; % burner pressure loss. Prb needs to be found from design
f = (Cpt*T04-Cp*T03)/(HV-Cpt*T04); % fuel air ratio
mdotf = mdot*f; % fuel flow rate
ER = f/0.067; % equivalence ratio

% (5) Turbine exit
T05 = T04-deltah0c/(itas*Cpt); % T05 found via energy equation
P05 = P04*(T05/T04)^(rt/((rt-1)*itapt)); % P05 found via polytropic eff. 

% (e) Nozzle exit
Pe = P1 % variable area nozzle, perfectly expanded
Tes = T05*(Pe/P05)^((rn-1)/rn) 
Te = T05*(1-itan*(1-Tes/T05))
T0e = T05
ue = sqrt((T0e-Te)*2*Cpn)
T = mdot*(ue-u)

% other performance parameters (for fun)
itap = T*u/(mdot*((1+f)*ue^2/2-u^2/2)); % propulsive efficiency
itath = ((1+f)*ue^2/2-u^2/2)/(f*HV); % thermal efficiency
ita = itap*itath; % total efficiency
Tpermdot = T/mdot; % specific thrust
TSFC = f/((1+f)*ue-u); % thrust specific fuel consumption
mdotf_kgperhr = mdotf*3600; % how much fuel consumed in an hour of operation
% 6.1 tons of fuel to fly for an hour



%% Combuster constants
r=1.4;
rt=1.29; 
T04=1600;    %K
MW=28.8;     %kg/kmol
Rbar=8314;   %J/kmol*K

R=Rbar/MW;    %J/kg*K
cp=rt*R/(rt-1);

M3=cz/sqrt(r*R*(T03-(cz^2)/(2*cp)));

rt=sqrt(A1/pi);

%% f calculation - Lean Burn
hR=43.4e6;    %J/kg
fstoic=0.067; 

%Lean Solution - 
f=(T04-T03)/(hR/cp);
ER=f/fstoic;


%% Diffuser Calculations
theta=15;        %degrees
M3prime=0.1;   %Control the residence time
Aratio_aero=1.3; %Aero diffuser area ratio

syms A3prime

exponent=exp(((r*M3^2)/2)*(((1-A3/A3prime)^2)+(1-A3/A3prime)^6));

machexpression=(M3/M3prime)*((1+(M3prime^2)*((r-1)/2))/...
    (1+(M3^2)*((r-1)/2)))^((r+1)/(2*(r-1)));

A3prime=A3*double(solve(A3prime==exponent*machexpression,A3prime));
Aratio=A3prime/A3;
Pratiodiff=exp(((-r*M3^2)/2)*(((1-A3/A3prime)^2)+(1-A3/A3prime)^6));
Po3prime=P03*Pratiodiff;         %Diffuser exit stagnation pressure
 
a=1;
b=-2*pi*rt;
c=-A3;

hi1=rt+sqrt((rt^2)-(A3/pi));
hi2=rt-sqrt((rt^2)-(A3/pi));

if hi1>=rt
    hi=hi2;
else
    hi=hi1;
end

rm=rt-hi/2;
DL=A3prime/(4*pi*rm);  %Dump diffuser exit diameter
Ae=1.3*A3;             %Assumed aero diffuser area ratio
he=Ae/(4*pi*rm);       %Aero diff exit diameter

router=rm+DL/2;        %Diffuser outer radius
rinner=rm-DL/2;        %Diffuser inner radius

dg=hi;                  %Aero to Swirler Gap
rd=0.4*DL;
Laero=(he-hi)/(2*tand(theta));
Ldiffuser=Laero+dg+rd;

%Gas Conditions prior to burning
rho_o3=rho3*(1+((r-1)/2)*M3^2)^(1/(r-1));
To3prime=T03*Pratiodiff^((r-1)/r);    %K
rho_o3prime=rho_o3*Pratiodiff^(1/r);       %kg/m3

%% Flame Tube Length
tres=5e-3;  %seconds

rho_3prime=rho_o3prime*(1+((r-1)/2)*M3prime^2)^(-1/(r-1));

Lc=(mdot*(1+f)*tres)/(rho_3prime*A3prime);

Lburner_total=Ldiffuser+Lc;

%% Po4
Rair=288;   %j/kg*K
CLC=20;         %Combustor loss coefficient Po3,4/qref
qref=(1/(2*rho_o3))*((mdot/A3prime)^2);

%Cold Loss (1-Coldloss)
ColdLoss=CLC*(Rair/2)*((mdot*sqrt(T03))/(A3prime*P03))^2; %Ratio
%Hot Loss (Po3-HotLoss)
HotLoss=qref*((T04/T03)-1);  %Pa

P04=P03*(1-ColdLoss)-HotLoss;

%% Liner Area and Effective Hole Area
lambda=0.45;    %Diffuser loss coefficient
SplitRatio=0.5; %msnout/mair

%Liner Area
msn=mdot*SplitRatio;
ALiner=A3prime*(1-((-lambda+(1-msn)^2)/(CLC-lambda*(A3prime/Ae)^2))^(1/3))

%effective hole area
ALheff=A3prime*sqrt(1/(CLC-((Po3prime-P03)/qref)));






%% Turbine constants

itas = 0.99;
itapt = 0.920;

N = 8.067714290272103e+03;
rmcexit = 0.532333813769897; % Assuming burner is symmetric
M4 = 0.4;  % Placeholder exit mach number of burner



iT = 3; % Number of stages

deltah0t = -(1/itas)*deltah0c;

P4 = P04/(1+(1/2)*(rt-1)*(M4^2))^(rt/(rt-1));
rho4 = P4/(Rb*T4);
mdotT = mdot + mdotf;
vb = M4*sqrt(rt*Rb*T4);
dT = A4/(2*pi*rmcexit);
rtT = rmcexit + dT;
rhT = rmcexit - dT;  % Assume constant area; mean, tip, and hub radii constant

omega = N*(pi/30);
uT = omega*rmcexit;

%% First Stage
alpha11 = 0*(pi/180); % Inlet angle
alpha31 = alpha11; % Repeating stage
M21 = 1.1; % Choke initial stator
M11 = M4;
T011 = T04;
T11 = T4;
cosAlpha21 = cos(alpha11)*(M11/M21)*((1 + ((rt - 1)/2)*(M11*M11))/((1 + ((rt - 1)/2)*(M21*M21))))^((rt + 1)/(2*(1 - rt)));
alpha21 = acos(cosAlpha21);


cz11 = vb*cos(alpha11);
cth11 = vb*sin(alpha11);
T021 = T011; % No work on flow;
T21 = T021/(1+(1/2)*(rt-1)*(M21^2));
a21 = sqrt(rt*Rb*T21);
c21 = M21*a21;
cth21 = c21*sin(alpha21);
cz21 = cth21/tan(alpha21);

flowCoeff = (cth11 - cth21)/(uT);
deltah0T1 = flowCoeff*(uT^2);

wz11 = cz11;
wth11 = cth11 - uT;
wz21 = cz21;
wth21 = cth21 - uT;


