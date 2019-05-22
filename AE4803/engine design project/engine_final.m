clc;clear

% conditions
M = 0.8;
P1 = 24000;
T1 = 219;

% reference value
Tref = 288;
Pref = 101300;

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
hR = 43.4e6; % heat value of fuel, from example OD engine problem
N = 8067.7142902721 % rough current 6 stage compressor design value
rtip = 0.55; % tip radius of compressor
rmcexit = 0.532333813769897; % mean radius of compressor exit
% turbine needs it

disp('--- On Design Performance ---')
disp('--- (1) Diffuser Inlet ---')
% (1) Diffuser inlet
T01 = T1*(1+(r-1)/2*M^2); % inlet stagnation temperature
P01 = P1*(1+(r-1)/2*M^2)^(r/(r-1)); % inlet stagnation pressure
u = M*sqrt(r*R*T1); % freestream velocity
rho1 = P1/(R*T1); % freestream density
A1 = mdot/(rho1*u); % diffuser face area

disp('--- (2) Compressor inlet ---')
% (2) Compressor inlet
T02 = T01; % no work done, T0 remains the same
P02 = P01*Prd; % some stagnation pressure loss
M2 = 0.5; % design choice by Martin as suggested in ppt
T2 = T02/(1+(r-1)/2*M2^2); % find T2
P2 = P02/(1+(r-1)/2*M2^2)^(r/(r-1)); % find P2
cz = M2*sqrt(r*R*T2); % find axial velocity (no swirl component yet)
rho2 = P2/(R*T2); % find rho2 for sizing
A2 = mdot/(rho2*cz); % find A2
mdotc2 = mdot*sqrt(T02/Tref)/(P02/Pref);
Nc2 = N/sqrt(T02/Tref);

disp('--- (3) Compressor exit, burner diffuser inlet ---')
% (3) Compressor exit, burner diffuser inlet
T03 = T02*Prc^((r-1)/(r*itapc)); % T03 found via polytropic efficiency
P03 = P02*Prc; % P03 found via designed compressor pressure ratio
deltah0c = Cp*(T03-T02); % work done by compressor
T3 = T03-cz^2/(2*Cp); % find T3 from kinetic energy
M3 = cz/sqrt(r*R*T3); % find M3 
P3 = P03/(1+(r-1)/2*M3^2)^(r/(r-1)); % find P3
rho3 = P3/(T3*R); % find rho3
rho03 = P03/(T03*R); % find rho03
A3 = mdot/(rho3*cz); % find A3

disp('--- (4) Burner exit, turbine inlet ---')
% (4) Burner exit, turbine inlet
% T04 is known
f = (Cpt*T04-Cp*T03)/(hR*itab-Cpt*T04); % fuel air ratio
mdotf = mdot*f; % fuel flow rate
ER = f/0.067; % equivalence ratio

disp('--- (4 detail) detailed burner analysis ---')
% (4 detail) Wesley's detailed analysis of combustor
% --- Diffuser Calculations ---
theta=15;        %degrees
M3prime=0.1;   %Control the residence time
Aratio_aero=1.3; %Aero diffuser area ratio

syms A3prime

exponent=exp(((r*M3^2)/2)*(((1-A3/A3prime)^2)+(1-A3/A3prime)^6));

machexpression=(M3/M3prime)*((1+(M3prime^2)*((r-1)/2))/...
    (1+(M3^2)*((r-1)/2)))^((r+1)/(2*(r-1)));

A3prime=A3*double(solve(A3prime==exponent*machexpression,A3prime));
Aratio=A3prime/A3;
Pratio=exp(((-r*M3^2)/2)*(((1-A3/A3prime)^2)+(1-A3/A3prime)^6));
P03prime=P03*Pratio;         %Combuster exit stagnation pressure

hi1=rtip+sqrt((rtip^2)-(A3/pi));
hi2=rtip-sqrt((rtip^2)-(A3/pi));

if hi1>=rtip
    hi=hi2;
else
    hi=hi1;
end

rm=rtip-hi/2;
Dref=A3prime/(2*pi*rm);           %Dump diffuser exit diameter
Ae=1.3*A3;             %Assumed aero diffuser area ratio
he=Ae/(2*pi*rm);       %Aero diff exit diameter

router=rm+Dref/2;        %Diffuser outer radius
rinner=rm+Dref/2;        %Diffuser inner radius

% --- Liner Area ---
CLC=20;         %Combustor loss coefficient Po3,4/qref
lambda=0.45;    %Diffuser loss coefficient
msn=0.5; 

ALratio=nthroot((((1-msn)^2)-lambda)/(CLC-(A3prime/A3)^2),3);
ALiner=ALratio*A3prime;

DL=ALiner/(2*pi*rm);
dg=hi;                  %Aero to Swirler Gap
rd=0.4*DL;
Laero=(he-hi)/(2*tand(theta));
Ldiffuser=Laero+dg+rd;

%Gas Conditions prior to burning
To3prime=T03*Pratio^((r-1)/r);    %K
rho_o3prime=rho03*Pratio^(1/r);       %kg/m3

% --- Flame Tube Length ---
tres=5e-3;  %seconds

rho_3prime=rho_o3prime*(1+((r-1)/2)*M3prime^2)^(-1/(r-1));

Lc=(mdot*(1+f)*tres)/(rho_3prime*A3prime);

Lburner_total=Ldiffuser+Lc;

% --- Po4 ---
R=288;   %j/kg*K
CLC=20;
Uref=mdot/(rho03*A3prime);
qref=(rho03*Uref^2)/2;

%Cold Loss
ColdLoss=CLC*(R/2)*((mdot*sqrt(T03))/(A3prime*P03))^2;

% Liner Loss
P0diff=P03prime-P03;

ALh_ref=A3prime*sqrt(1/(CLC-((P0diff)/qref))); %Hole reference area
P0Liner=P03*(R/2)*(((mdot*sqrt(T03))/(ALh_ref*P03))^2); %Hole losses

P034Liner=(P03/qref)*(P0diff+P0Liner)*(R/2)*(((mdot*sqrt(T03))/(A3prime*P03))^2);

%Hot Loss (Po3-HotLoss)
HotLoss=qref*((T04/T03)-1);  %Pa

P04=P03*(1-ColdLoss)-HotLoss;

Prb =P04/P03;

% --- Exit conditions ---

M4=0.4; %Desired exit mach number

T4=T04*(1+itab*((rt-1)/2)*M4^2)^-1;

A4=((mdot*(1+f)*sqrt(T04))/P04)*(sqrt(Rb/rt)/M4)*((1+((rt-1)/2)*M4^2)^((rt+1)/(2*(rt-1))));


disp('--- (5) Turbine exit ---')
% (5) Turbine exit
T05 = T04-deltah0c/(itas*Cpt); % T05 found via energy equation
P05 = P04*(T05/T04)^(rt/((rt-1)*itapt)); % P05 found via polytropic eff. 

disp('--- (5 detail) Turbine detailed analysis')
% (5 detail)

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

% -- First Stage --
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


disp('--- (e) Nozzle exit ---')
% (e) Nozzle exit
Pe = P1; % variable area nozzle, perfectly expanded
Tes = T05*(Pe/P05)^((rn-1)/rn);
Te = T05*(1-itan*(1-Tes/T05));
T0e = T05;
ue = sqrt((T0e-Te)*2*Cpn);
Me = ue/sqrt(rn*R*Te);
T = mdot*(ue-u)

disp('--- other performance parameters ---')
% other performance parameters (for fun)
itap = T*u/(mdot*((1+f)*ue^2/2-u^2/2)); % propulsive efficiency
itath = ((1+f)*ue^2/2-u^2/2)/(f*hR); % thermal efficiency
ita = itap*itath; % total efficiency
Tpermdot = T/mdot; % specific thrust
TSFC = f/((1+f)*ue-u); % thrust specific fuel consumption
mdotf_kgperhr = mdotf*3600; % how much fuel consumed in an hour of operation
% 6.1 tons of fuel to fly for an hour

%% OD performance
disp('--- Off design performance ---')

% Required parameters: mass flow rate, compression ratio, rpm

% OD conditions
M_OD = 0.5;
P1_OD = 57200;
T1_OD = 258;
T04_OD = 1500;

disp('--- (1) OD Diffuser Inlet ---')
% (1) Diffuser inlet
T01_OD = T1_OD*(1+(r-1)/2*M_OD^2); % inlet stagnation temperature
P01_OD = P1_OD*(1+(r-1)/2*M_OD^2)^(r/(r-1)); % inlet stagnation pressure
u_OD = M_OD*sqrt(r*R*T1_OD); % freestream velocity
rho1_OD = P1_OD/(R*T1_OD); % freestream density
% mdot_OD = rho1_OD*u_OD*A1

disp('--- (2) OD Compressor inlet ---')
% (2) Compressor Inlet
T02_OD = T01_OD; % assume adiabatic diffuser
P02_OD = P01_OD*Prd; % assume Prd does not change
% compute new rpm
Nc2_OD = Nc2*sqrt(T04_OD/T02_OD)/sqrt(T04/T02);
N_OD = Nc2_OD*sqrt(T02_OD/Tref)

disp('--- (3) OD Compressor exit, burner diffuser inlet ---')
% (3) Compressor exit, burner diffuser inlet
% assume f negligible
% assume itas remains constant
% assume turbine temperature ratio doesn't change much
% power matching requirement
Trc_OD = (T04_OD/T02_OD)/(T04/T02)*((T03/T02)-1)+1;
% assume compressor polytropic efficiency doesn't change
Prc_OD = Trc_OD^((r*itapc)/(r-1))
T03_OD = T02_OD*Trc_OD;
P03_OD = P02_OD*Prc_OD;
% assume Prb and f don't change too much, get mass flow rate
mdotc2_OD = mdotc2*Prc_OD/Prc*sqrt(T04/T02)/sqrt(T04_OD/T02_OD);
mdot_OD = mdotc2_OD*P02_OD/Pref/sqrt(T02_OD/Tref)

disp('--- (4) OD Burner exit, turbine inlet ---')
% (4) Burner exit, turbine inlet
% T04_OD is known
% burner pressure loss
% Prb needs to be found from design
% may change for OD? depends on the compressor guy
P04_OD = P03_OD*Prb;
f_OD = (Cpt*T04_OD-Cp*T03_OD)/(hR*itab-Cpt*T04_OD); % fuel air ratio
mdotf_OD = mdot_OD*f_OD; % fuel flow rate
ER_OD = f_OD/0.067; % equivalence ratio

disp('--- (5) OD Turbine exit ---')
% (5) Turbine exit
% assume turbine temperature ratio remains constant
T05_OD = T04_OD*(T05/T04);
% P05 found via polytropic eff. 
P05_OD = P04_OD*(T05/T04)^(rt/((rt-1)*itapt));

disp('--- (e) OD Nozzle exit ---')
% (e) Nozzle exit
Pe_OD = P1_OD; % variable area nozzle, perfectly expanded
Tes_OD = T05_OD*(Pe_OD/P05_OD)^((rn-1)/rn);
Te_OD = T05_OD*(1-itan*(1-Tes_OD/T05_OD));
T0e_OD = T05_OD;
ue_OD = sqrt((T0e_OD-Te_OD)*2*Cpn);
Me_OD = ue_OD/sqrt(rn*R*Te_OD);
T_OD = mdot_OD*(ue_OD-u_OD);

disp('--- other OD performance parameters ---')
% other performance parameters (for fun)
itap_OD = T_OD*u_OD/(mdot_OD*((1+f_OD)*ue_OD^2/2-u_OD^2/2)); % propulsive efficiency
itath_OD = ((1+f_OD)*ue_OD^2/2-u_OD^2/2)/(f_OD*hR); % thermal efficiency
ita_OD = itap_OD*itath_OD; % total efficiency
Tpermdot_OD = T_OD/mdot_OD; % specific thrust
TSFC_OD = f_OD/((1+f_OD)*ue_OD-u_OD); % thrust specific fuel consumption
mdotf_kgperhr_OD = mdotf_OD*3600; % how much fuel consumed in an hour of operation
% 7.9 tons of fuel to fly for an hour








