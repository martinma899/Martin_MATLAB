%% generate all cases and do optimization
num_total_modslots = 8;
num_mandatory_mods = numel(mandatory_mods_arr);
num_flexible_mods = numel(flexible_mods_arr);
num_open_mod_slots = num_total_modslots-num_mandatory_mods;
num_builds = nchoosek(num_flexible_mods,num_open_mod_slots);

fprintf('\nNumber of builds to be calculated: %d\n',num_builds)
inp = input('continue? y/n\n','s');
switch inp
  case 'y'
    fprintf('\nproceeding to compute build stats')
  otherwise
    error('mission aborted.')
end

all_remaining_mods_combs = combnk(flexible_mods_arr,num_open_mod_slots);
all_builds = [];
for i = 1:num_builds
  all_builds = [all_builds;[mandatory_mods_arr all_remaining_mods_combs(i,:)]];
end
all_builds = sort(all_builds,2);

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



