clc;clear

% constants
R = 287; % air gas constant
r = 1.4; % air specific heat ratio

% get compressor exit information
[A3,M3,rmax3,T03,P03] = compressor_design

% some clean up
rmin3 = sqrt(rmax3^2-A3/pi)
hi = rmax3-rmin3
rm = (rmax3+rmin3)/2

% design parameters
pre_diff_M_reduction_percent = 0.3
M3prime = 0.1
dgoverhi = 1
theta = 20
rdoverDL = 0.25
mdotprimaryovermdot = 0.5

% compute 31 properties
M3star = M3*(1-pre_diff_M_reduction_percent)
A3star = A3*M3/M3star*((1+(r-1)/2*M3star^2)/(1+(r-1)/2*M3^2))^((r+1)/(2*(r-1)))
A3staroverA3 = A3star/A3
hstar = A3star/(2*pi*rm)
rmax3star = rm+hstar/2
rmin3star = rm-hstar/2

% assume no loss from pre-diffuser
P031 = P03

% estimate A32 and P032 with pressure loss empirical correlation
[A3prime,~] = recsolveA32 (A3,A3*5,r,A3,M3,M3prime)
P03primeoverP03 = exp(-r*M3^2/2*((1+A3/A3prime)^2+(1-A3/A3prime)^6))
P03prime = P03*P03primeoverP03
h3prime = A3prime/(2*pi*rm)
rmax32 = rm+h3prime/2
rmin32 = rm-h3prime/2

% compute dg
dg = dgoverhi*hi

% compute Lp 
Lp = (hstar-hi)/2/tand(theta)

% compute DL
Aflametube = mdotprimaryovermdot*A3prime
DL = Aflametube/(2*pi*rm)

% compute rd 
rd = rdoverDL*DL

Ldiff = Lp+dg+rd

plot([rmax3 rmax3star rmax32],'ro-')
hold on
plot([rmin3 rmin3star rmin32],'bo-')
hold off

