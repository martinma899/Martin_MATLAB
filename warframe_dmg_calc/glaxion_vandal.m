clear

CC = 0.14; % crit chance
CM = 2; % crit multi
m = 200; % magazine size
FR = 24; % fire rate
RLT = 1.8; % reload time
RLS = 1/RLT; % reload speed
d = 29; % damage per shot
base_avg_dps = d*(1+(CM-1)*CC)*(1/FR+1/(RLS*m))^(-1) % expected base dps

DM = 1.65+1.65+0.6+0.6-0.15; % damage per shot multiplier
MM = 0.9; % multishot multiplier
CCM = 1.5; % crit chance multipler
CMM = 1.2; % crit multi multipler
FRM = 0.9; % fire rate multiplier
RLSM = 0; % reload speed multiplier
mM = 0; % magazine size multiplier

DMT = 1+DM % total damage multiplier
MMT = 1+MM % total multishot multiplier
CMT = (1+(CM*(1+CMM)-1)*CC*(1+CCM))/(1+(CM-1)*CC) % total crit multiplier
UTMT = (1/(FR*(1+FRM))+1/(RLS*m*(1+RLSM)*(1+mM)))^(-1)...
  /(1/FR+1/(RLS*m))^(-1) % total utility multiplier
TMT = DMT*MMT*CMT*UTMT % total multiplier
avg_dps = d*(1+DM)*(1+MM)*(1+(CM*(1+CMM)-1)*CC*(1+CCM))*...
  (1/(FR*(1+FRM))+1/(RLS*m*(1+RLSM)*(1+mM)))^(-1) % expected dps
burst_dps = d*(1+DM)*(1+MM)*(1+(CM*(1+CMM)-1)*CC*(1+CCM))*...
  (1/(FR*(1+FRM)))^(-1) % expected dps