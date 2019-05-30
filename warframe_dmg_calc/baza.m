clear

CC = 0.26; % crit chance
CM = 3; % crit multi
m = 40; % magazine size
FR = 16.67; % fire rate
RLT = 1.4; % reload time
RLS = 1/RLT; % reload speed
d = 16; % damage per shot
base_dps = d*(1+(CM-1)*CC)*(1/FR+1/(RLS*m))^(-1) % expected base dps

DM = 1.65+1.8; % damage per shot multiplier
MM = 0.9+0.6; % multishot multiplier
CCM = 1.5; % crit chance multipler
CMM = 1.2; % crit multi multipler
FRM = 0; % fire rate multiplier
RLSM = 0.6; % reload speed multiplier
mM = 0; % magazine size multiplier

DMT = 1+DM % total damage multiplier
MMT = 1+MM % total multishot multiplier
CMT = 1+(CM*(1+CMM)-1)*CC*(1+CCM) % total crit multiplier
UTMT = (1/(FR*(1+FRM))+1/(RLS*m*(1+RLSM)*(1+mM)))^(-1)...
  /(1/FR+1/(RLS*m))^(-1) % total utility multiplier
TMT = DMT*MMT*CMT*UTMT % total multiplier
dps = d*(1+DM)*(1+MM)*(1+(CM*(1+CMM)-1)*CC*(1+CCM))*...
  (1/(FR*(1+FRM))+1/(RLS*m*(1+RLSM)*(1+mM)))^(-1) % expected dps