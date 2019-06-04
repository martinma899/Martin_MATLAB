%% create unmodded weapon wpb
wpb.NAME = 'Glaxion_Vandal';
wpb.CC = 0.14; % crit chance
wpb.CM = 2; % crit multi
wpb.m = 200; % magazine size
wpb.FR = 24; % fire rate
wpb.RLT = 1.8; % reload time
wpb.RLS = 1/wpb.RLT; % reload speed
wpb.AFR = (1/wpb.FR+1/(wpb.m*wpb.RLS))^(-1);% average fire rate taking into account of reload
wpb.d = 29; % damage per shot

% indirect DPS multipliers
wpb.CCMT = 1; % total crit chance multiplier
wpb.CMMT = 1; % total crit multiplier multiplier
wpb.RLSMT = 1; % total reload speed multiplier
wpb.mMT = 1; % total magazine size multiplier
wpb.BCMT = 1+(wpb.CM-1)*wpb.CC; % total crit contribution multiplier. 
% this is crit dps increase comparing to the non-critting weapon. 

% direct average/burst DPS multipliers
wpb.DMT = 1; % total damage multiplier
wpb.MMT = 1; % total multishot multiplier
wpb.FDMT = 1; % total faction damage multiplier
wpb.FRMT = 1; % total fire rate multiplier
wpb.AFRMT = 1; % total average fire rate multiplier
wpb.MCMT = 1; % modded crit contribution multiplier. 
% this is crit dps increase comparing to the unmodded critting weapon.  
wpb.AVDPSMT = 1; % total average DPS multiplier
wpb.BDPSMT = 1; % total burst DPS multiplier

wpb.build = []; % mods equipped
wpb.avg_dps = wpb.d*(1+(wpb.CM-1)*wpb.CC)*...
  (1/wpb.FR+1/(wpb.RLS*wpb.m))^(-1); % average dps
wpb.burst_dps = wpb.d*(1+(wpb.CM-1)*wpb.CC)*(1/wpb.FR)^(-1); % burst dps