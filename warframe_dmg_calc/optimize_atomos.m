%% house keeping
clear

%% create mods
Hornet_Strike = struct('name','Hornet Strike','DM',2.2,'MM',0,...
  'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Augur_Pact = struct('name','Augur Pact','DM',0.9,'MM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Barrel_Diffusion = struct('name','Barrel Diffusion','DM',0,'MM',0,...
  'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Lethal_Torrent = struct('name','Lethal Torrent','DM',0,'MM',0.6,...
  'FRM',0.6,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Primed_Pistol_Gambit = struct('name','Primed Pistol Gambit','DM',0,...
  'MM',0,'FRM',0,'CCM',1.53,'CMM',0,'RLSM',0,'mM',0);
Primed_Target_Cracker = struct('name','Primed Target Cracker','DM',0,...
  'MM',0,'FRM',0,'CCM',0,'CMM',0.9,'RLSM',0,'mM',0);
Elemental_Sixty_1 = struct('name','Elemental Sixty #1','DM',0.6,'MM',0,...
  'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Elemental_Sixty_2 = struct('name','Elemental Sixty #2','DM',0.6,'MM',0,...
  'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Elemental_Ninety_1 = struct('name','Elemental Ninety #1','DM',0.9,...
  'MM',0,'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Elemental_Ninety_2 = struct('name','Elemental Ninety #2','DM',0.9,...
  'MM',0,'FRM',0,'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Gunslinger = struct('name','Gunslinger','DM',0,'MM',0,'FRM',0.72,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);
Quickdraw = struct('name','Quickdraw','DM',0,'MM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0.48,'mM',0);
Slip_Magazine = struct('name','Slip Magazine','DM',0,'MM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0.3);
Magnum_Force = struct('name','Magnum Force','DM',1.35,'MM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);

%% put desirable mods in arsenal
mods = [Hornet_Strike;
  Barrel_Diffusion;
  Lethal_Torrent;
  Primed_Pistol_Gambit;
  Primed_Target_Cracker;
  Elemental_Sixty_1;
  Elemental_Sixty_2;
  Elemental_Ninety_1;
  Elemental_Ninety_2;
  Gunslinger;
  Quickdraw;
  Magnum_Force;
  Augur_Pact;
  Slip_Magazine;
  ];
%% choose mandatory mods (to reduce computation time)
mandatory_mods_arr = [6 7];

%% display all mods in arsenal
fprintf('\n--> Display All The Mods In Arsenal: <--\n\n')
mods_total = numel(mods);
for i = 1:mods_total
  fprintf('%i %s\n',i,mods(i).name)
end

%% create unmodded weapon wpb
wpb.NAME = 'ATOMOS';
wpb.CC = 0.15; % crit chance
wpb.CM = 1.7; % crit multi
wpb.m = 140; % magazine size
wpb.FR = 16; % fire rate
wpb.RLT = 2; % reload time
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

%% generate all cases and do optimization
num_total_modslots = 8;
num_mandatory_mods = numel(mandatory_mods_arr);
num_open_mod_slots = num_total_modslots-num_mandatory_mods;
num_remaining_mods = mods_total-num_mandatory_mods;

all_mods = 1:mods_total;
remaining_mods = setdiff(all_mods,mandatory_mods_arr);

all_remaining_mods_combs = combnk(remaining_mods,num_open_mod_slots);
all_builds = [];
for i = 1:size(all_remaining_mods_combs,1)
  all_builds = [all_builds;[mandatory_mods_arr all_remaining_mods_combs(i,:)]];
end

wp_arr = [];
for i = 1:size(all_builds,1)
  wp = wpb;
  this_build = all_builds(i,:);
  wp.build = this_build;
  for thismod = this_build
    
    wp.DMT = wp.DMT+mods(thismod).DM; % total damage multiplier
    wp.MMT = wp.MMT+mods(thismod).MM; % total multishot multiplier
    wp.CCMT = wp.CCMT+mods(thismod).CCM; % total crit chance multiplier
    wp.CMMT = wp.CMMT+mods(thismod).CMM; % total crit multiplier multiplier
    wp.FRMT = wp.FRMT+mods(thismod).FRM; % total fire rate multiplier
    wp.RLSMT = wp.RLSMT+mods(thismod).RLSM; % total reload speed multiplier
    wp.mMT = wp.mMT+mods(thismod).mM; % total magazine size multiplier

  end
  wp.d = wp.d*wp.DMT*wp.MMT; % total modified expected per shot damage
  wp.CC = wp.CC*wp.CCMT; % total modified crit chance
  wp.CM = wp.CM*wp.CMMT; % total modified crit damage
  wp.FR = wp.FR*wp.FRMT; % total modified fire rate
  wp.RLS = wp.RLS*wp.RLSMT; % total modified reload speed
  wp.RLT = 1/wp.RLS; % total modified reload time
  wp.m = wp.m*wp.mMT; % total modified magazine
  wp.AFR = (1/wp.FR+1/(wp.m*wp.RLS))^(-1); % modified average fire rate 
  % taking into account of reload
  
  wp.AFRMT = wp.AFR/wpb.AFR; % total average fire rate multiplier
  wp.BCMT = 1+(wp.CM-1)*wp.CC; % total base crit multiplier.
  % this is crit dps increase comparing to the non-critting weapon.
  wp.MCMT = wp.BCMT/wpb.BCMT; % total modded crit multiplier.
  % this is crit dps increase comparing to the unmodded critting weapon.
  
  wp.avg_dps = wp.d*wp.BCMT*wp.AFR; % average dps
  wp.burst_dps = wp.d*wp.BCMT*wp.FR; % burst dps
  
  wp.AVDPSMT = wp.DMT*wp.MMT*wp.MCMT*wp.AFRMT; % total average dps multiplier
  wp.BDPSMT = wp.DMT*wp.MMT*wp.MCMT*wp.FRMT; % total burst dps multiplier
  
  wp_arr = [wp_arr wp];
end

avg_dps_arr = [wp_arr.avg_dps]'; % extract average dps arr
[avg_dps_arr,ind] = unique(avg_dps_arr); % unique avg_dps_arr and wp_arr
wp_arr = wp_arr(ind);
[avg_dps_arr,ind] = sort(avg_dps_arr,'descend'); % sort avg_dps_arr and wp_arr
wp_arr = wp_arr(ind);

%% output results
optGun = wp_arr(1);
disp(optGun)
mod_name_arr = {mods.name}';
disp(mod_name_arr(optGun.build))
% disp(avg_dps_arr(1:10));

bar(avg_dps_arr)





