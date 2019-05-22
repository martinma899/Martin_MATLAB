function [A3,M3,rt,T03,P03] = compressor_design 
plotYN = false;

% gas constants
R = 287; % air gas constant
r = 1.4; % air specific heat ratio
Cp = R/(1-1/r); % air Cp

% conditions
Minf = 0.8;
P1 = 24000;
T1 = 219;

% Engine Pressure Losses
Prd = 0.985; % Diffuser pressure loss is give

% estimated stage efficiency
ita = 0.905;

% Design Requirements
mdot = 48; % engine mass flow rate
Prc = 18; % compressor pressure ratio

% design choices

% pick what IGV inlet mach number should be diffused to. controls cz
% higher: higher cz
M2 = 0.5;
% pick IGV solidity
sigmaIGV = 0.4;
% pick IGV angle
% higher: higher u, less stages allowed.
% too high: rotor diffusion factor constraint lead to unachievable results
alpha1 = 25;
% choose rt as per requirement
% higher: more powerful
% too high: engine too big
rt = 0.55;
% pick 1st stage rotor tip mach
% higher: more powerful
% too high: too much shock development at 1st rotor tip & efficiency loss
M1relt1 = 1.38;
% rotor diffusion factor and solidity
Dfr = 0.5;
sigmar = 1.2;
% stator solidity
sigmas = 1.4;
sigmafs = 0.5;
% number of stages
nstage = 6;
% chord length of blades
bIGVref = 0.02;
brref = 0.05;
brrefarr = [0.07;0.05;0.05;0.05;0.045;0.035];
bsref = 0.05;
bfsref = 0.05;


% (1) Diffuser inlet
T01 = T1*(1+(r-1)/2*Minf^2); % inlet stagnation temperature
P01 = P1*(1+(r-1)/2*Minf^2)^(r/(r-1)); % inlet stagnation pressure
uinf = Minf*sqrt(r*R*T1); % freestream velocity
rho1 = P1/(R*T1); % freestream density
A1 = mdot/(rho1*uinf); % diffuser face area

% assume diffuser inlet disk has no cone sitting inside
% calculate inlet size for plotting and visualization purposes
rtinlet = sqrt(A1/pi); % diffuser inlet radius
rhinlet = 0; % no cone for diffuser
rminlet = (rtinlet+rhinlet)/2; % mean diffuser radius

% (2) IGV inlet
T02 = T01; % no work done, T0 remains the same
P02 = P01*Prd; % some stagnation pressure loss
T2 = T02/(1+(r-1)/2*M2^2); % find T2
P2 = P02/(1+(r-1)/2*M2^2)^(r/(r-1)); % find P2
cz = M2*sqrt(r*R*T2); % find axial velocity (no swirl component yet)
rho2 = P2/(R*T2); % find rho2 for sizing
A2 = mdot/(rho2*cz); % find A2
% Calculate IGV inlet radii
rtIGVin = rt; 
rhIGVin = sqrt(rtIGVin^2-A2/pi);
rmIGVin = (rtIGVin+rhIGVin)/2;

% Estimate exact number of IGV blades based on reference IGV blade chord
% length
nbladesIGV = round(2*pi*rmIGVin*sigmaIGV/bIGVref);
bIGV = sigmaIGV*2*pi*rmIGVin/nbladesIGV;

% (211) inlet guide vane exit, 1st stage rotor inlet
c11 = cz/cosd(alpha1); % velocity after inlet guiding vane
ct11 = cz*tand(alpha1); % tangencial velocity after inlet guiding vane
T011 = T02; % Assume IGV adiabatic
T11 = T011-c11^2/(2*Cp); % Find static temperature after IGV
M11 = c11/sqrt(r*R*T11); % find M after IGV
P011 = P02; % assume no pressure loss across IGV
P11 = P011/(1+(r-1)/2*M11^2)^(r/(r-1)); % find static pressure after IGV
rho11 = P11/(R*T11); % find density after IGV
A11 = mdot/(rho11*cz); % find IGV exit area to keep Cz constant
% compute IGV diffusion factor to check if design is reasonable
DfIGV = 1-c11/cz+(cz*tand(alpha1)/(2*sigmaIGV*cz));

% (11) 1st stage rotor inlet
% determine 1st stage rotor inlet sizes
rh1 = sqrt(rt^2-A11/pi);
rm1 = (rt+rh1)/2;
% solve for 1st stage inlet tip velocity triangle
wt11 = M1relt1*sqrt(r*R*T11);
betat11 = -acosd(cz/wt11);
wtt11 = -sqrt(wt11^2-cz^2);
ut11 = ct11-wtt11;

% Compute RPM from first stage compressor design
omega = ut11/rt;
RPM = omega*30/pi;

% Then find u for first stage rotor
u1 = omega*rm1;

% Continue to solve first stage (1) velocity triangle
wt11 = ct11-u1;
beta11 = atand(wt11/cz);
w11 = sqrt(wt11^2+cz^2);
M1rel1 = w11/sqrt(r*R*T11);

% find phi
phi1 = cz/u1;

% use rotor diffusion factor limit to solve for beta2
[beta21,~] = recsolvebeta2(-89.99,-0.01,Dfr,sigmar,w11,wt11,cz);

% more rotor angle info for rotor
small_phir1 = beta11-beta21; % flow turning angle of rotor
xir1 = beta11-small_phir1/2; % stagger angle, assuming circular camber

% solving the (2) velocity triangle
wt21 = cz*tand(beta21);
deltawt121 = wt21-wt11;
deltact121 = deltawt121;
psi1 = deltact121/u1;
ct21 = ct11+deltact121;
w21 = sqrt(cz^2+wt21^2);
alpha21 = atand(ct21/cz);
c21 = sqrt(ct21^2+cz^2);

% rotor number of blades and exact blade length
nbladesr1 = round(2*pi*rm1*sigmar/brrefarr(1));
br1 = sigmar*2*pi*rm1/nbladesr1;
brz1 = br1*cosd(xir1);

% estimate reynold's number of rotor blades for boundary layer health
Re1 = rho11*w11*br1/viscosity(T11);

% we're done with 1st stage rotor, start analyzing 1st stage stator

alpha3 = alpha1; % repeating stage
% more stator angle info
small_phis1 = alpha21-alpha3; % flow turning angle of stator
xis1 = alpha21-small_phis1/2; % stagger angle, assuming circular camber

% find total temperature after compression
% assuming adiabatic stator
T031 = T011+deltact121*u1/Cp; 
% estimate compression ratio from polytropic efficiency
Prs1 = (T031/T011)^(r*ita/(r-1)); 
% find first stage exit stagnation temperature
P031 = P011*Prs1;
% find stage 1 degree of reaction
% use the repeating stage formula
DOR1 = -0.5*phi1*(tand(beta21)+tand(beta11));

% further solve the (3) velocity triangle
ct31 = cz*tand(alpha3);
deltact231 = ct21-ct31;
c31 = sqrt(ct31^2+cz^2);
% estimate the stator diffusion factor from our chosen solidity
Dfs1 = 1-c31/c21+deltact231/(2*sigmas*c21);

% compute 1st stage exit properties
% design the exit area necessary to keep cz constant
T31 = T031-c31^2/(2*Cp);
M31 = c31/sqrt(r*R*T31);
P31 = P031/(1+(r-1)/2*M31^2)^(r/(r-1));
rho31 = P31/(R*T31);
A31 = mdot/(rho31*cz);

% stator number of blades and exact blade length
% use rm1 for this approximation, subject to error
nbladess1 = round(2*pi*rm1*sigmas/brref);
bs1 = sigmas*2*pi*rm1/nbladess1;
bsz1 = bs1*cosd(xis1);

% Parameters that directly affect next stage calculation
% must store
A3arr = A31;
c3arr = c31;
ct3arr = ct31;
T3arr = T31;
T03arr = T031;
P03arr = P031;
rho3arr = rho31;

% Parameters that do not directly affect next stage calculation
% not necessary to store, but stored for analysis purpose

c1arr = c11;
rharr = rh1;
rmarr = rm1;
M1relarr = M1rel1;
uarr = u1;
phiarr = phi1;
beta1arr = beta11;
w1arr = w11;
beta2arr = beta21;
deltact12arr = deltact121;
w2arr = w21;
alpha2arr = alpha21;
c2arr = c21;
psiarr = psi1;
DORarr = DOR1;
c3arr = c31;
Dfsarr = Dfs1;
M3arr = M31;
Prsarr = Prs1;
Rearr = Re1;
nbladesrarr = nbladesr1;
nbladessarr = nbladess1;

small_phirarr = small_phir1;
small_phisarr = small_phis1;
xirarr = xir1;
xisarr = xis1;
brarr = br1;
bsarr = bs1;
brzarr = brz1;
bszarr = bsz1;

for i = 2:(nstage)
  
  % 2nd stage rotor
  % 2nd stage inlet radius sizing
  A31 = A3arr(end); % 2nd stage inlet assume the same as 1st stage exit
  % determine 2nd stage rotor inlet sizes
  rh2 = sqrt(rt^2-A31/pi); 
  rm2 = (rt+rh2)/2;
  
  % rpm determined from first stage, so we can use it to find u and phi
  u2 = omega*rm2;
  phi2 = cz/u2;
  
  % solving the 2nd stage (1) velocity triangle
  c12 = c3arr(end);
  ct12 = ct3arr(end);
  wt12 = ct12-u2;
  beta12 = atand(wt12/cz);
  w12 = sqrt(wt12^2+cz^2);
  T12 = T3arr(end);
  M1rel2 = w12/sqrt(r*R*T12);
  
  % use rotor diffusion factor limit to solve for beta2
  [beta22,~] = recsolvebeta2(-89,-1,Dfr,sigmar,w12,wt12,cz);
  
  % more rotor angle info
  small_phir2 = beta12-beta22; % flow turning angle of rotor
  xir2 = beta12-small_phir2/2; % stagger angle, assuming circular camber
  
  % solving the (2) velocity triangle
  wt22 = cz*tand(beta22);
  deltawt122 = wt22-wt12;
  deltact122 = deltawt122;
  psi2 = deltact122/u2;
  ct22 = ct12+deltact122;
  w22 = sqrt(cz^2+wt22^2);
  alpha22 = atand(ct22/cz);
  c22 = sqrt(ct22^2+cz^2);
  
  % rotor number of blades and exact blade length
  nbladesr2 = round(2*pi*rm2*sigmar/brrefarr(i));
  br2 = sigmar*2*pi*rm2/nbladesr2;
  brz2 = br2*cosd(xir2);
  
  % estimate reynold's number of rotor blades for boundary layer health
  Re2 = rho3arr(end)*w11*br1/viscosity(T11);
  
  % we're done with 2nd stage rotor, start analyzing 2nd stage stator
  
  alpha3 = alpha1; % repeating stage
  % more stator angle info
  small_phis2 = alpha22-alpha3; % flow turning angle of stator
  xis2 = alpha22-small_phis2/2; % stagger angle, assuming circular camber
  
  % find total temperature after compression
  % assuming adiabatic stator
  T012 = T03arr(end);
  T032 = T012+deltact122*u2/Cp;
  % estimate compression ratio from polytropic efficiency
  Prs2 = (T032/T012)^(r*ita/(r-1));
  % find first stage exit stagnation temperature
  P012 = P03arr(end);
  P032 = P012*Prs2;
  % find stage 2 degree of reaction
  % use the repeating stage formula
  DOR2 = -0.5*phi2*(tand(beta22)+tand(beta12));
  
  % further solve the (3) velocity triangle
  ct32 = cz*tand(alpha3);
  deltact232 = ct22-ct32;
  c32 = sqrt(ct32^2+cz^2);
  % estimate the stator diffusion factor from our chosen solidity
  Dfs2 = 1-c32/c22+deltact232/(2*sigmas*c22);
  
  % compute 1st stage exit properties
  % design the exit area necessary to keep cz constant
  T32 = T032-c32^2/(2*Cp);
  M32 = c32/sqrt(r*R*T32);
  P32 = P032/(1+(r-1)/2*M32^2)^(r/(r-1));
  rho32 = P32/(R*T32);
  A32 = mdot/(rho32*cz);
  
  % stator number of blades and exact blade length
  % use rm1 for this approximation, subject to error
  nbladess2 = round(2*pi*rm2*sigmas/bsref);
  bs2 = sigmas*2*pi*rm2/nbladess2;
  bsz2 = bs2*cosd(xis2);
  
  % Parameters that directly affect next stage calculation
  A3arr = [A3arr;A32];
  c3arr = [c3arr;c32];
  ct3arr = [ct3arr;ct32];
  T3arr = [T3arr;T32];
  T03arr = [T03arr;T032];
  P03arr = [P03arr;P032];
  rho3arr = [rho3arr;rho32];
  
  % Parameters that do not directly affect next stage calculation
  c1arr = [c1arr;c12];
  rharr = [rharr;rh2];
  rmarr = [rmarr;rm2];
  M1relarr = [M1relarr;M1rel2];
  uarr = [uarr;u2];
  phiarr = [phiarr;phi2];
  beta1arr = [beta1arr;beta12];
  w1arr = [w1arr;w12];
  beta2arr = [beta2arr;beta22];
  deltact12arr = [deltact12arr;deltact122];
  w2arr = [w2arr;w22];
  alpha2arr = [alpha2arr;alpha22];
  c2arr = [c2arr;c22];
  psiarr = [psiarr;psi2];
  DORarr = [DORarr;DOR2];
  Dfsarr = [Dfsarr;Dfs2];
  M3arr = [M3arr;M32];
  Prsarr = [Prsarr;Prs2];
  Rearr = [Rearr;Re2];
  nbladesrarr = [nbladesrarr;nbladesr2];
  nbladessarr = [nbladessarr;nbladess2];
  
  small_phirarr = [small_phirarr;small_phir2];
  small_phisarr = [small_phisarr;small_phis2];
  xirarr = [xirarr;xir2];
  xisarr = [xisarr;xis2];
  brarr = [brarr;br2];
  bsarr = [bsarr;bs2];
  brzarr = [brzarr;brz2];
  bszarr = [bszarr;bsz2];
end

ARrarr = (rt-rharr)./brarr;

% do the last stage flow straightener calculation

T03 = T032;
T3 = T03-cz^2/(2*Cp);
M3 = cz/sqrt(r*R*T3);
P03 = P032; % assume no loss across flow straigntener
P3 = P03/(1+(r-1)/2*M3^2)^(r/(r-1));
rho3 = P3/(R*T3);
A3 = mdot/(rho3*cz);
Dffs = 1-cz/c32+(c32*sind(alpha1)/(2*sigmafs*c32));

% radii of flow straightener inlet
rhfs = sqrt(rt^2-A3arr(end)/pi);
rmfs = (rt+rhfs)/2;
% flow straightener number of blades and exact blade length
nbladesfs = round(2*pi*rmfs*sigmar/bfsref);
bfs = sigmafs*2*pi*rmfs/nbladesfs;

Prs = prod(Prsarr);
T03 = T032;
axial_gap_percent = 0.25;
complength = sum(brzarr+bszarr)*(1+axial_gap_percent);



% plot some results to see

if plotYN

close all
subplot(3,4,1)
hold on
grid on
plot(-1:nstage,[rtinlet;rt*ones(nstage+1,1)],'bo-')
plot(-1:nstage,[rhinlet;rhIGVin;rharr],'ro-')
plot(-1:nstage,[rminlet;rmIGVin;rmarr],'ko-')
axis([-1 nstage 0 rt])
legend('rt','rh','rm')
xlabel('stage')
ylabel('engine radius')
title('engine radius')
text(-1,0.1,'Inlet')
text(0,0.1,'IGV')

subplot(3,4,2)
hold on
grid on
plot(ones(nstage,1)*alpha1,'ro-')
plot(alpha2arr,'bo-')
axis([1 nstage 0 90])
xlabel('stage')
ylabel('alpha')
legend('alhpa1','alpha2')
title('alpha')

subplot(3,4,3)
hold on
grid on
plot(beta1arr,'ro-')
plot(beta2arr,'bo-')
axis([1 nstage -90 0])
xlabel('stage')
ylabel('beta')
legend('beta1','beta2')
title('beta')

subplot(3,4,4)
hold on
grid on
plot(small_phirarr,'ro-')
plot(small_phisarr,'bo-')
axis([1 nstage -90 90])
xlabel('stage')
ylabel('flow turning angle')
legend('rotor','stator')
title('flow turning angle')

subplot(3,4,5)
hold on
grid on
psilimit = [0.2 0.5];
triplet = [186 242 167]/255;
fill([1 nstage nstage 1 1],...
  [psilimit(1),psilimit(1),psilimit(2),psilimit(2),psilimit(1)],...
  'k','FaceColor',triplet,'FaceAlpha',0.5,'EdgeColor','none');
plot(psiarr,'ro-')
axis([1 nstage 0 1])
xlabel('stage')
ylabel('stage loading coeff')
title('stage loading coefficient')

subplot(3,4,6)
hold on
grid on
philimit = [0.3 0.9];
fill([1 nstage nstage 1 1],...
  [philimit(1),philimit(1),philimit(2),philimit(2),philimit(1)],...
  'k','FaceColor',triplet,'FaceAlpha',0.5,'EdgeColor','none');
plot(phiarr,'ro-')
axis([1 nstage 0 1])
xlabel('stage')
ylabel('stage flow coeff')
title('stage flow coefficient')

subplot(3,4,7)
hold on
grid on
DORlimit = [0.5 0.9];
fill([1 nstage nstage 1 1],...
  [DORlimit(1),DORlimit(1),DORlimit(2),DORlimit(2),DORlimit(1)],...
  'k','FaceColor',triplet,'FaceAlpha',0.5,'EdgeColor','none');
plot(DORarr,'ro-')
axis([1 nstage 0 1])
xlabel('stage')
ylabel('DOR')
title('degree of reaction')

subplot(3,4,8)
hold on
grid on
plot(xirarr,'ro-')
plot(xisarr,'bo-')
axis([1 nstage -90 90])
xlabel('stage')
ylabel('stagger angle')
legend('rotor','stator')
title('stagger angle (assume circular pitch line)')


subplot(3,4,9)
hold on
grid on
Dfslimit = [0 0.6];
fill([1 nstage nstage 1 1],...
  [Dfslimit(1),Dfslimit(1),Dfslimit(2),Dfslimit(2),Dfslimit(1)],...
  'k','FaceColor',triplet,'FaceAlpha',0.5,'EdgeColor','none');
pr = plot(ones(nstage,1)*Dfr,'ro-');
ps = plot(Dfsarr,'bo-');
axis([1 nstage 0 1])
xlabel('stage')
ylabel('Dfs')
title('Stator diffusion factor')
legend([pr ps],{'Rotor','Stator'})
  
subplot(3,4,10)
hold on
grid on
Relimit = [3e5 4e6];
fill([1 nstage nstage 1 1],...
  [Relimit(1),Relimit(1),Relimit(2),Relimit(2),Relimit(1)],...
  'k','FaceColor',triplet,'FaceAlpha',0.5,'EdgeColor','none');
plot(Rearr,'ro-')
xlabel('stage')
ylabel('Re')
title('Rotor Blade Reynold''s number')

subplot(3,4,11)
hold on
grid on
plot(nbladesrarr,'ro-')
plot(nbladessarr,'bo-')
xlabel('stage')
ylabel('number of blades')
legend('Rotor','Stator')
title('number of blades for each stage')

subplot(3,4,11)
hold on
grid on
plot(nbladesrarr,'ro-')
plot(nbladessarr,'bo-')
xlabel('stage')
ylabel('number of blades')
legend('Rotor','Stator')
title('number of blades for each stage')

subplot(3,4,12)
hold on
grid on
plot(brarr*100,'ro-')
plot(bsarr*100,'bo-')
plot(brzarr*100,'r^-')
plot(bszarr*100,'b^-')
xlabel('stage')
ylabel('blade length (cm)')
legend('Rotor b','Stator b','Rotor bz','Stator bz')
title('blade length')

end

end
























