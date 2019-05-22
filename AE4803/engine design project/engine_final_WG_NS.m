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
N = 8067.7142902721; % rough current 6 stage compressor design value
rtip = 0.55; % tip radius of compressor
rmcexit = 0.532333813769897; % mean radius of compressor exit: 0.532333813769897
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


%% Global constants
r=1.4;
rt=1.29; 
T04=1600;    %K
MW=28.8;     %kg/kmol
Rbar=8314;   %J/kmol*K

Rc=Rbar/MW;    %J/kg*K
Ra=287;     %J/kg*K
cp3=r*Ra/(r-1);
cp4=rt*Rc/(rt-1);

M3=cz/sqrt(r*Ra*(T03-(cz^2)/(2*cp3)));
rho_03=rho3*(1+((r-1)/2)*M3^2)^(1/(r-1));

% Diffuser

%Values given in problem statement
CLC=20;
lambda=0.45;
ColdLoss=0.025;          %Desired max cold loss 
msn=0.5;
Aratio_AeroDiff=1.3;    %Aero diffuser Ae/Ai
theta=15;               %Aero diffuser half angle

%Post diffused reference area and radii
Aref=(mdot*sqrt(T03)/P03)*sqrt((Ra*CLC)/(2*ColdLoss));
Aratio=Aref/A3;

Dref=Aref/(2*pi*rmcexit);
rinner=rmcexit-Dref/2;
router=rmcexit+Dref/2;

%Pressure loss across diffuser
q3=0.5*rho3*cz^2;
P0diff=-(lambda*q3);
P03prime=P03+P0diff;
Pdiffratio=P03prime/P03;

%Diffused Mach number
syms M3prime

M3prime=real(double(solve(Aref==sqrt(Ra*T03/r)*(mdot/(P03prime*M3prime))*...
    (1+((r-1)/2)*M3prime^2)^((r+1)/(2*(r-1))),M3prime)));
M3prime=M3prime(1); %Multiple roots from previous equation, one reasonable answer

%Liner area
ALratio=1-nthroot((((1-msn)^2)-lambda)/(CLC-lambda*(Aratio^2)),3);
ALiner=ALratio*Aref

%Burner depth
DL=ALiner/(2*pi*rmcexit);

%Diffuser lengths
Laerodiff=(0.3*A3)/(4*pi*rmcexit*tan(theta*pi/180));
hi=A3/(2*pi*rmcexit);

dg=hi;
rd=0.4*DL;

Ldiffuser=Laerodiff+dg+rd;

%Post-expanded gas properties (pre-combustion)
T03prime=T03*Pdiffratio^((r-1)/r);         %K
rho_03prime=rho_03*Pdiffratio^(1/r);       %kg/m3

% Flame Tube Length
tres=5e-3;  %seconds

rho_3prime=rho_03prime*(1+((r-1)/2)*M3prime^2)^(-1/(r-1));
Lc=(mdot*(1+f)*tres)/(rho_3prime*Aref);
Lburner_total=Ldiffuser+Lc;

% Po4
Uref=mdot/(rho_03*Aref);
qref=(rho_03*Uref^2)/2;

%Cold Loss
ColdLoss=CLC*(Ra/2)*((mdot*sqrt(T03))/(Aref*P03))^2;

% Liner Loss
diff=CLC-P0diff/qref;
root=sqrt(1/(CLC-((P0diff)/qref)));
ALh_eff=Aref*sqrt(1/(CLC-((P0diff)/qref))); %Hole effective area
P0Liner=P03*(Ra/2)*(((mdot*sqrt(T03))/(ALh_eff*P03))^2); %Hole losses

P034Liner=(P03/qref)*(P0diff+P0Liner)*(Ra/2)*(((mdot*sqrt(T03))/(Aref*P03))^2);
LinerP0ratio=1-P034Liner/P03;
%Hot Loss (Po3-HotLoss)
HotLoss=qref*((T04/T03)-1);  %Pa

P04=P03*(1-ColdLoss)-HotLoss-P034Liner;
Prb=P04/P03;

% Exit conditions
M4=0.4;             %Control mach number to the turbine
rmbexit=0.4;        %Want rm exit to the turbine to be fixed

T4=T04*(1+((rt-1)/2)*M4^2)^-1;
A4=((mdot*(1+f)*sqrt(T04))/P04)*(sqrt(Rc/rt)/M4)*...
    ((1+((rt-1)/2)*M4^2)^((rt+1)/(2*(rt-1))));

hbexit=A4/(2*pi*rmbexit);
rbinner=rmbexit-hbexit/2;
rbouter=rmbexit+hbexit/2;

%%

disp('--- (5) Turbine exit ---')
% (5) Turbine exit
T05 = T04-deltah0c/(itas*Cpt); % T05 found via energy equation
P05 = P04*(T05/T04)^(rt/((rt-1)*itapt)); % P05 found via polytropic eff. 

disp('--- (5 detail) Turbine detailed analysis')
% (5 detail)

iT = 2; % Number of stages

deltah0t = -(1/itas)*deltah0c;

P4 = P04/(1+(1/2)*(rt-1)*(M4^2))^(rt/(rt-1));
rho4 = P4/(Rb*T4);
mdotT = mdot + mdotf;
vb = M4*sqrt(rt*Rb*T4);
dT = A4/(2*pi*rmbexit);
rtT1 = rmbexit + dT;
rhT1 = rmbexit - dT;  

omega = N*(pi/30);
uT = omega*rmbexit;

% -- First Stage --   Assume constant mean radius, cz
alpha11 = 20; % Inlet angle
alpha31 = alpha11; % Repeating stage
M21 = 1.1; % Choke initial stator
M11 = M4;
T011 = T04;
P011 = P04;
T11 = T4;

c11 = vb;
cz = c11*cosd(alpha11);
cth11 = c11*sind(alpha11);
T021 = T011; % No work on flow;
T21 = T021/(1+(1/2)*(rt-1)*(M21^2));
a21 = sqrt(rt*Rb*T21);
c21 = M21*a21;
alpha21 = acosd((M11*sqrt(T11))/(M21*sqrt(T21))); % About 67 degrees, could be a bit high
cth21 = cz*tand(alpha21);

psiT1 = (cth11 - cth21)/(uT);
deltah0T1 = psiT1*(uT^2);
phiT1 = cz/uT;

wz = cz;
wth11 = cth11 - uT;
wth21 = cth21 - uT;

beta11 = atand(wth11/cz);
beta21 = atand(wth21/cz);
beta31 = beta11;

cth31 = uT + cz*tand(beta31);
wth31 = cth31 - uT;
degR1 = -(wth21 + wth31)/(2*uT);

w11 = sqrt(wz^2 + wth11^2);
w21 = sqrt(wz^2 + wth21^2);
w31 = sqrt(wz^2 + wth31^2);

% Zweifel Criteria
bT = 0.05; % Length of turbine blade.
ZLP = -1; % Zweifel Loading Parameter

% Stator
cthmean12 = (cth11 + cth21)/2;
zeta1S = atand(cthmean12/cz);
sigmaZ1S = (1/ZLP)*((2*cosd(alpha21))/(cosd(alpha11)))*(sind(alpha11-alpha21));
sigma1S = sigmaZ1S/cosd(zeta1S);
nBlade1S = round(2*pi*rmbexit*sigma1S/bT);

% Rotor
wthmean23 = (wth21 + wth31)/2;
zeta1R = atand(wthmean23/wz);
sigmaZ1R = (1/ZLP)*((2*cosd(beta21))/(cosd(beta11)))*(sind(beta11-beta21));
sigma1R = sigmaZ1R/cosd(zeta1R);
nBlade1R = round(2*pi*rmbexit*sigma1R/bT);

c31 = sqrt(cz^2 + cth31^2);

T031 = T011 + deltah0T1/Cpt;
P031 = P011*(T031/T011)^(rt/((rt-1)*itapt));
T31 = T031 - (c31^2)/(2*Cpt);
M31 = c31/sqrt(rt*Rb*T31);
P31 = P031/(1 + ((rt-1)/2)*M31^2)^(rt/(rt-1));
rho31 = P31/(Rb*T31);
A31 = mdotT/(rho31*cz);
dT3 = A31/(2*pi*rmbexit);
rtT3 = rmbexit + dT3;
rhT3 = rmbexit - dT3;  

deltah0Trem = deltah0t - deltah0T1; % Remaining h0 required
if iT > 1
    psipS = (deltah0Trem/(uT^2))/(iT-1);
else
    psipS = 0;
end

% Prepare for loop
AT = [A4, A31];
rhT = [rhT1, rhT3];
rtT = [rtT1, rtT3];
c1T = c11;
c3T = c31;
alpha1T = alpha11;
alpha2T = alpha21;
alpha3T = alpha31;
w1T = w11;
w3T = w31;
beta1T = beta11;
beta2T = beta21;
beta3T = beta31;
T03T = T031;
P03T = P031;
rho3T = rho31;
phiT = phiT1;
psiT = psiT1;
nBladeST = nBlade1S;
nBladeRT = nBlade1R;
degRT = degR1;

for j = 2:(iT)
    A1T = AT(end);
    alpha1 = alpha3T(end);
    if j == iT
        alpha3 = 0;
    else
        alpha3 = alpha1;
    end
    beta1 = beta3T(end);
    beta3 = beta1;
    c1 = c3T(end);
    w1 = w3T(end);
    cth1 = c1*sind(alpha1);
    cth2 = cth1 - (psipS)*uT;
    cth3 = uT + cz*tand(beta3);
    wth3 = cth3 - uT;
    c3 = sqrt(cth3^2 + cz^2);
    w3 = sqrt(wth3^2 + cz^2);
    alpha2 = atand(cth2/cz);
    wth2 = cth2 - uT;
    beta2 = atand(wth2/cz);
    deltah0TL = psipS*(uT^2);
    degRL = -(wth2 + wth3)/(2*uT);
    phiTL = cz/uT;
    
    T01L = T03T(end);
    P01L = P03T(end);
    T03L = T01L + deltah0TL/Cpt;
    P03L = P01L*(T03L/T01L)^(rt/((rt-1)*itapt));
    T3L = T03L - (c3^2)/(2*Cpt);
    M3L = c31/sqrt(rt*Rb*T3L);
    P3L = P03L/(1 + ((rt-1)/2)*M3L^2)^(rt/(rt-1));
    rho3L = P3L/(Rb*T3L);
    A3L = mdotT/(rho3L*cz);
    dT3L = A3L/(2*pi*rmbexit);
    rtT3L = rmbexit + dT3L;
    rhT3L = rmbexit - dT3L;
    
    % Stator
    cthmean12L = (cth1 + cth2)/2;
    zetaSL = atand(cthmean12L/cz);
    sigmaZSL = (1/ZLP)*((2*cosd(alpha2))/(cosd(alpha1)))*(sind(alpha1-alpha2));
    sigmaSL = sigmaZSL/cosd(zetaSL);
    nBladeSL = round(2*pi*rmbexit*sigmaSL/bT);

    % Rotor
    wthmean23L = (wth2 + wth3)/2;
    zetaRL = atand(wthmean23L/wz);
    sigmaZRL = (1/ZLP)*((2*cosd(beta2))/(cosd(beta1)))*(sind(beta1-beta2));
    sigmaRL = sigmaZRL/cosd(zetaRL);
    nBladeRL = round(2*pi*rmbexit*sigmaRL/bT);
    
    AT = [AT, A3L];
    rhT = [rhT, rhT3L];
    rtT = [rtT, rtT3L];
    c1T = [c1T, c1];
    c3T = [c3T, c3];
    alpha1T = [alpha1T, alpha1];
    alpha2T = [alpha2T, alpha2];
    alpha3T = [alpha3T, alpha3];
    w1T = [w1T, w1];
    w3T = [w3T, w3];
    beta1T = [beta1T, beta1];
    beta2T = [beta2T, beta2];
    beta3T = [beta3T, beta3];
    T03T = [T03T, T03L];
    P03T = [P03T, P03L];
    rho3T = [rho3T, rho3L];
    phiT = [phiT, phiTL];
    psiT = [psiT, psipS];
    nBladeST = [nBladeST, nBladeSL];
    nBladeRT = [nBladeRT, nBladeRL];
    degRT = [degRT, degRL];
end

disp('--- (e) Nozzle exit ---')
% (e) Nozzle exit
Pe = P1; % variable area nozzle, perfectly expanded
Tes = T05*(Pe/P05)^((rn-1)/rn);
Te = T05*(1-itan*(1-Tes/T05));
T0e = T05;
ue = sqrt((T0e-Te)*2*Cpn);
Me = ue/sqrt(rn*R*Te);
T = mdot*(ue-u);

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








