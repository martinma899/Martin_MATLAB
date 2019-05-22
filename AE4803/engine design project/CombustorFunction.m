clc;
clear;
close all

%% Hard coded values to get from main code
T03=615;       %K
P03=6.48e5;    %Pa
rho03=3.5003; %kg/m3
mdot=48;      %kg/s
cz=154;        %rpm
A3=0.089;      %m2

rtip=0.55;

%% Global constants
r=1.4;
rt=1.29; 
T04=1600;    %K
MW=28.8;     %kg/kmol
Rbar=8314;   %J/kmol*K

Rc=Rbar/MW    %J/kg*K
R=287;     %J/kg*K
Cp=r*R/(r-1);
Cpt=rt*Rc/(rt-1);

M3=cz/sqrt(r*R*(T03-(cz^2)/(2*Cp)));


%% f calculation - Lean Burn
hR=43.4e6;    %J/kg
fstoic=0.067; 
itab=0.98;

%Lean Solution - 
f=(1/itab)*(Cpt*T04-Cp*T03)/(hR-Cpt*T04)
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


%% Liner Area
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

%% Flame Tube Length
tres=5e-3;  %seconds

rho_3prime=rho_o3prime*(1+((r-1)/2)*M3prime^2)^(-1/(r-1));

Lc=(mdot*(1+f)*tres)/(rho_3prime*A3prime);

Lburner_total=Ldiffuser+Lc;

%% Po4
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

TotalPratio=P04/P03


%% Exit conditions

M4=0.4; %Desired exit mach number

T4=T04*(1+itab*((rt-1)/2)*M4^2)^-1;

A4=((mdot*(1+f)*sqrt(T04))/P04)*(sqrt(Rc/rt)/M4)*((1+((rt-1)/2)*M4^2)^((rt+1)/(2*(rt-1))));




