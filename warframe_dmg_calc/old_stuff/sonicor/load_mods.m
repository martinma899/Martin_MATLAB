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

Primed_Elemental_1 = blank_mod;
Primed_Elemental_1.name = 'Primed_Elemental_1';
Primed_Elemental_1.DM = 1.35;

Primed_Elemental_2 = blank_mod;
Primed_Elemental_2.name = 'Primed_Elemental_2';
Primed_Elemental_2.DM = 1.35;

Gunslinger = blank_mod;
Gunslinger.name = 'Gunslinger';
Gunslinger.FRM = 0.72;

Quickdraw = blank_mod;
Quickdraw.name = 'Quickdraw';
Quickdraw.RLSM = 0.48;

Primed_Quickdraw = blank_mod;
Primed_Quickdraw.name = 'Primed_Quickdraw';
Primed_Quickdraw.RLSM = 0.72;

Anemic_Agility = blank_mod;
Anemic_Agility.name = 'Anemic_Agility';
Anemic_Agility.DM = -0.15;
Anemic_Agility.FRM = 0.9;

Slip_Magazine = blank_mod;
Slip_Magazine.name = 'Slip_Magazine';
Slip_Magazine.mM = 0.3;

Primed_Slip_Magazine = blank_mod;
Primed_Slip_Magazine.name = 'Primed_Slip_Magazine';
Primed_Slip_Magazine.mM = 0.45;

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
  Magnum_Force;
  Barrel_Diffusion;
  Lethal_Torrent;
  Primed_Pistol_Gambit;
  Primed_Target_Cracker;
  Expel_Mod;
  Primed_Expel_Mod;
  Augur_Pact;
  Elemental_Sixty_1;
  Elemental_Sixty_2;
  Elemental_Ninety_1;
  Elemental_Ninety_2;
  Elemental_Ninety_3;
  Primed_Elemental_1;
  Primed_Elemental_2;
  Gunslinger;
  Anemic_Agility;
  Quickdraw;
  Primed_Quickdraw;
  Slip_Magazine;
  Primed_Slip_Magazine;
  Creeping_Bullseye;
  Hollow_Point;
  Hydrhaulic_Crosshair;
  Sharpened_Bullets;
  Ice_Storm;
  Stunning_Speed;
  Tainted_Clip;
  ];
mod_name_arr = {mods.name}';
mods_total = numel(mods);
all_mods = 1:mods_total;