%% house keeping
clear

%% create mods
blank_mod = struct('name','','DM',0,'MM',0,'FDM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);

Hornet_Strike = blank_mod; 
Hornet_Strike.name = 'Hornet_Strike';
Hornet_Strike.DM = 2.2;

Augur_Pact = blank_mod;
Augur_Pact.name = 'Augur_Pact';
Augur_Pact.DM = 0.9;

Barrel_Diffusion = blank_mod;
Barrel_Diffusion.name = 'Barrel_Diffusion';
Barrel_Diffusion.MM = 1.2;

Lethal_Torrent = blank_mod;
Lethal_Torrent.name = 'Lethal_Torrent';
Lethal_Torrent.MM = 0.6;
Lethal_Torrent.FRM = 0.6;

Primed_Pistol_Gambit = blank_mod;
Primed_Pistol_Gambit.name = 'Primed_Pistol_Gambit';
Primed_Pistol_Gambit.CCM = 1.53;

Primed_Target_Cracker = blank_mod;
Primed_Target_Cracker.name = 'Primed_Target_Cracker';
Primed_Target_Cracker.CMM = 0.9;

Elemental_Sixty_1 = blank_mod;
Elemental_Sixty_1.name = 'Elemental_Sixty_1';
Elemental_Sixty_1.DM = 0.6;

Elemental_Sixty_2 = blank_mod;
Elemental_Sixty_2.name = 'Elemental_Sixty_2';
Elemental_Sixty_2.DM = 0.6;

Elemental_Ninety_1 = blank_mod;
Elemental_Ninety_1.name = 'Elemental_Ninety_1';
Elemental_Ninety_1.DM = 0.9;

Elemental_Ninety_2 = blank_mod;
Elemental_Ninety_2.name = 'Elemental_Ninety_2';
Elemental_Ninety_2.DM = 0.9;

Elemental_Ninety_3 = blank_mod;
Elemental_Ninety_3.name = 'Elemental_Ninety_3';
Elemental_Ninety_3.DM = 0.9;

Gunslinger = blank_mod;
Gunslinger.name = 'Gunslinger';
Gunslinger.FRM = 0.72;

Quickdraw = blank_mod;
Quickdraw.name = 'Quickdraw';
Quickdraw.RLSM = 0.48;

Anemic_Agility = blank_mod;
Anemic_Agility.name = 'Anemic_Agility';
Anemic_Agility.DM = -0.15;
Anemic_Agility.FRM = 0.9;

Slip_Magazine = blank_mod;
Slip_Magazine.name = 'Slip_Magazine';
Slip_Magazine.mM = 0.3;

Magnum_Force = blank_mod;
Magnum_Force.name = 'Magnum_Force';
Magnum_Force.DM = 1.35;

Creeping_Bullseye = blank_mod;
Creeping_Bullseye.name = 'Creeping_Bullseye';
Creeping_Bullseye.FRM = -0.36;
Creeping_Bullseye.CCM = 0.48;

Hollow_Point = blank_mod;
Hollow_Point.name = 'Hollow_Point';
Hollow_Point.DM = -0.15;
Hollow_Point.CMM = 0.6;

Ice_Storm = blank_mod;
Ice_Storm.name = 'Ice_Storm';
Ice_Storm.DM = 0.4;
Ice_Storm.mM = 0.4;

Stunning_Speed = blank_mod;
Stunning_Speed.name = 'Stunning_Speed';
Stunning_Speed.RLSM = 0.4;

Tainted_Clip = blank_mod;
Tainted_Clip.name = 'Tainted_Clip';
Tainted_Clip.RLSM = -0.3;
Tainted_Clip.mM = 0.6;

Expel_Mod = blank_mod;
Expel_Mod.name = 'Expel_Mod';
Expel_Mod.FDM = 0.3;

Primed_Expel_Mod = blank_mod;
Primed_Expel_Mod.name = 'Primed_Expel_Mod';
Primed_Expel_Mod.FDM = 0.45;

Hydrhaulic_Crosshair = blank_mod;
Hydrhaulic_Crosshair.name = 'Hydrhaulic_Crosshair';
Hydrhaulic_Crosshair.CCM = 1.35;

Sharpened_Bullets = blank_mod;
Sharpened_Bullets.name = 'Sharpened_Bullets';
Sharpened_Bullets.CMM = 0.75;

%% put desirable mods in arsenal
mods = [Hornet_Strike;
  Barrel_Diffusion;
  Lethal_Torrent;
  Primed_Pistol_Gambit;
  Primed_Target_Cracker;
  %Elemental_Sixty_1;
  %Elemental_Sixty_2;
  Elemental_Ninety_1;
  Elemental_Ninety_2;
  %Elemental_Ninety_3;
  %Gunslinger;
  Anemic_Agility;
  Quickdraw;
  %Magnum_Force;
  %Augur_Pact;
  Slip_Magazine;
  Creeping_Bullseye;
  Hollow_Point;
  %Hydrhaulic_Crosshair;
  Ice_Storm;
  %Sharpened_Bullets;
  Stunning_Speed;
  Tainted_Clip;
  %Expel_Mod;
  Primed_Expel_Mod;
  ];
%% choose mandatory mods (to reduce computation time)
mandatory_mods_arr = [1 2 16];

%% display all mods in arsenal
fprintf('\n--> Display All The Mods In Arsenal: <--\n\n')
mods_total = numel(mods);
for i = 1:mods_total
  fprintf('%i %s\n',i,mods(i).name)
end

%% create unmodded weapon wpb
wpb.NAME = 'Sonicor';
wpb.CC = 0.1; % crit chance
wpb.CM = 1.25; % crit multi
wpb.m = 15; % magazine size
wpb.FR = 1.25; % fire rate
wpb.RLT = 3; % reload time
wpb.RLS = 1/wpb.RLT; % reload speed
wpb.AFR = (1/wpb.FR+1/(wpb.m*wpb.RLS))^(-1);% average fire rate taking into account of reload
wpb.d = 200; % damage per shot

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

%% generate all cases and do optimization
num_total_modslots = 8;
num_mandatory_mods = numel(mandatory_mods_arr);
num_open_mod_slots = num_total_modslots-num_mandatory_mods;
num_remaining_mods = mods_total-num_mandatory_mods;

all_mods = 1:mods_total;
remaining_mods = setdiff(all_mods,mandatory_mods_arr);

all_remaining_mods_combs = combnk(remaining_mods,num_open_mod_slots);
num_builds = size(all_remaining_mods_combs,1);
all_builds = [];
for i = 1:num_builds
  all_builds = [all_builds;[mandatory_mods_arr all_remaining_mods_combs(i,:)]];
end

fprintf('\nNumber of builds to be calculated: %d\n',num_builds)
inp = input('continue? y/n\n','s');
switch inp
  case 'y'
    fprintf('\nproceeding to compute build stats')
  otherwise
    fprintf('\nmission aborted.')
    return;
end

wp_arr = [];
for i = 1:size(all_builds,1)
  wp = wpb;
  this_build = all_builds(i,:);
  wp.build = this_build;
  for thismod = this_build
    
    wp.DMT = wp.DMT+mods(thismod).DM; % total damage multiplier
    wp.MMT = wp.MMT+mods(thismod).MM; % total multishot multiplier
    wp.FDMT = wp.FDMT+mods(thismod).FDM; % total faction damage multiplier
    wp.CCMT = wp.CCMT+mods(thismod).CCM; % total crit chance multiplier
    wp.CMMT = wp.CMMT+mods(thismod).CMM; % total crit multiplier multiplier
    wp.FRMT = wp.FRMT+mods(thismod).FRM; % total fire rate multiplier
    wp.RLSMT = wp.RLSMT+mods(thismod).RLSM; % total reload speed multiplier
    wp.mMT = wp.mMT+mods(thismod).mM; % total magazine size multiplier

  end
  wp.d = wp.d*wp.DMT*wp.MMT*wp.FDMT; % total modified expected per shot damage
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
  
  wp.AVDPSMT = wp.DMT*wp.MMT*wp.FDMT*wp.MCMT*wp.AFRMT; % total average dps multiplier
  wp.BDPSMT = wp.DMT*wp.MMT*wp.FDMT*wp.MCMT*wp.FRMT; % total burst dps multiplier
  
  wp_arr = [wp_arr wp];
  
  fprintf('%5.2f percent complete\n',i/num_builds*100)
end

avg_dps_arr = [wp_arr.avg_dps]'; % extract average dps arr
[avg_dps_arr,ind] = unique(avg_dps_arr); % unique avg_dps_arr and wp_arr
wp_arr = wp_arr(ind);
[avg_dps_arr,ind] = sort(avg_dps_arr,'descend'); % sort avg_dps_arr and wp_arr
wp_arr = wp_arr(ind);

%% output top ten builds

mod_name_arr = {mods.name}';
num_builds = 20;
for i = 20:-1:1
  fprintf('\n\n--> Build Ranking #%d <--\n\n',i)
  disp(mod_name_arr(wp_arr(i).build))
  fprintf('\nAverage DPS: %10.2f\n',wp_arr(i).avg_dps);
  fprintf('  Burst DPS: %10.2f\n',wp_arr(i).burst_dps);
  fprintf('avg DPS as percent of top build: %5.2f%%\n\n',wp_arr(i).avg_dps/wp_arr(1).avg_dps*100);
end

plot([wp_arr.avg_dps],'b.-')



