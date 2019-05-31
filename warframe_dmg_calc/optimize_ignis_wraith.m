clear

mod_name_arr = {'Hornet Strike';
  'Barrel Diffusion';
  'Lethal Torrent';
  'Primed Pistol Gambit';
  'Primed Target Cracker';
  'Magnum Force';
  'Elemental #1';
  'Elemental #2';
  'Elemental #3';
  'Elemental #4';
  'Gunslinger';
  'Quickdraw';
  'Slip Magazine'};

disp([num2cell([1:numel(mod_name_arr)]') mod_name_arr]);

mods = [];
mods_total = 13;
blank_mod = struct('name','blank','DM',0,'MM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);
for i = 1:mods_total
  mods = [mods blank_mod];
end

mods(1).name = 'Hornet Strike';
mods(1).DM = 2.2;
mods(2).name = 'Barrel Diffusion';
mods(2).MM = 1.2;
mods(3).name = 'Lethal Torrent';
mods(3).MM = 0.6;
mods(3).FRM = 0.6;
mods(4).name = 'Primed Pistol Gambit';
mods(4).CCM = 1.53;
mods(5).name = 'Primed Target Cracker';
mods(5).CMM = 0.9;
mods(6).name = 'Magnum Force';
mods(6).DM = 1.35;
mods(7).name = 'Elemental #1';
mods(7).DM = 0.6;
mods(8).name = 'Elemental #2';
mods(8).DM = 0.6;
mods(9).name = 'Elemental #3';
mods(9).DM = 0.6;
mods(10).name = 'Elemental #4';
mods(10).DM = 0.6;
mods(11).name = 'Gunslinger';
mods(11).FRM = 0.72;
mods(12).name = 'Quickdraw';
mods(12).RLSM = 0.48;
mods(13).name = 'Slip Magazine';
mods(13).mM = 0.3;

% weapon base stats array
wpb.NAME = 'ATOMOS'
wpb.CC = 0.15; % crit chance
wpb.CM = 1.7; % crit multi
wpb.m = 140; % magazine size
wpb.FR = 16; % fire rate
wpb.RLT = 2; % reload time
wpb.RLS = 1/wpb.RLT; % reload speed
wpb.d = 29; % damage per shot
wpb.DMT = 1; % total damage multiplier
wpb.MMT = 1; % total multishot multiplier
wpb.CMT = 1; % total crit chance & damage multiplier
wpb.build = []; % mods equipped
wpb.avg_dps = wpb.d*(1+(wpb.CM-1)*wpb.CC)*...
  (1/wpb.FR+1/(wpb.RLS*wpb.m))^(-1) % average dps
wpb.burst_dps = wpb.d*(1+(wpb.CM-1)*wpb.CC)*(1/wpb.FR)^(-1) % burst dps

num_total_modslots = 8;
mandatory_mods_arr = [1 2 7 8];
num_mandatory_mods = numel(mandatory_mods_arr);
num_open_mod_slots = num_total_modslots-num_mandatory_mods
num_remaining_mods = mods_total-num_mandatory_mods

all_mods = 1:mods_total;
remaining_mods = setdiff(all_mods,mandatory_mods_arr);

all_remaining_mods_combs = combnk(remaining_mods,num_open_mod_slots);
all_builds = [];
for i = 1:size(all_remaining_mods_combs,1)
  all_builds = [all_builds;[mandatory_mods_arr all_remaining_mods_combs(i,:)]];
end
disp(all_builds)

wp_arr = [];
for i = 1:size(all_builds,1)
  wp = wpb;
  this_build = all_builds(i,:);
  wp.build = this_build;
  for thismod = this_build
    wp.CC = wp.CC*(1+mods(thismod).CCM); % crit chance
    wp.CM = wp.CM*(1+mods(thismod).CMM); % crit multi
    wp.m = wp.m*(1+mods(thismod).mM); % magazine size
    wp.FR = wp.FR*(1+mods(thismod).FRM); % fire rate
    wp.RLS = wp.RLS*(1+mods(thismod).RLSM); % reload speed
    wp.RLT = 1/wp.RLS; % reload time
    wp.d = wp.d*(1+mods(thismod).DM); % damage per shot
    wp.DMT = wp.DMT+mods(thismod).DM; % total damage multiplier
    wp.MMT = wp.MMT+mods(thismod).MM; % total multishot multiplier
%     wp.CMT = (1+(wpb.CM*(1+wpb.CMM)-1)*wpb.CC*(1+wpb.CCM))...
%       /(1+(wpb.CM-1)*wpb.CC); % total crit chance & damage multiplier
    wp.avg_dps = wp.d*(1+(wp.CM-1)*wp.CC)*...
      (1/wp.FR+1/(wp.RLS*wp.m))^(-1); % average dps
    wp.burst_dps = wp.d*(1+(wp.CM-1)*wp.CC)*(1/wp.FR)^(-1); % burst dps
  end
  disp(wp.avg_dps)
  wp_arr = [wp_arr wp];
end





