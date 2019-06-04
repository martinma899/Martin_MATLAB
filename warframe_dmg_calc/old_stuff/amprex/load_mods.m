%% create mods
blank_mod = struct('name','','DM',0,'MM',0,'FDM',0,'FRM',0,...
  'CCM',0,'CMM',0,'RLSM',0,'mM',0);

Argon_Scope = blank_mod; 
Argon_Scope.name = 'Argon_Scope';
Argon_Scope.CCM = 1.35;

Bane_Mod = blank_mod; 
Bane_Mod.name = 'Bane_Mod';
Bane_Mod.DM = 0.3;

Bladed_Rounds = blank_mod; 
Bladed_Rounds.name = 'Bladed_Rounds';
Bladed_Rounds.CMM = 1.2;

Critical_Delay = blank_mod; 
Critical_Delay.name = 'Critical_Delay';
Critical_Delay.CCM = 0.48;
Critical_Delay.FRM = -0.36;

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

Fast_Hands = blank_mod; 
Fast_Hands.name = 'Fast_Hands';
Fast_Hands.RLSM = 0.3;

Hammer_Shot = blank_mod; 
Hammer_Shot.name = 'Hammer_Shot';
Hammer_Shot.CMM = 0.6;

Heavy_Caliber = blank_mod; 
Heavy_Caliber.name = 'Heavy_Caliber';
Heavy_Caliber.DM = 1.5;

Magazine_Warp = blank_mod; 
Magazine_Warp.name = 'Magazine_Warp';
Magazine_Warp.mM = 0.3;

Point_Strike = blank_mod; 
Point_Strike.name = 'Point_Strike';
Point_Strike.CCM = 1.5;

Primed_Bane_Mod = blank_mod; 
Primed_Bane_Mod.name = 'Primed_Bane_Mod';
Primed_Bane_Mod.FDM = 0.45;

Primed_Cryo_Rounds = blank_mod;
Primed_Cryo_Rounds.name = 'Primed_Cryo_Rounds';
Primed_Cryo_Rounds.DM = 1.65; 

Primed_Fast_Hands = blank_mod; 
Primed_Fast_Hands.name = 'Primed_Fast_Hands';
Primed_Fast_Hands.RLSM = 0.55;

Primed_Shred = blank_mod;
Primed_Shred.name = 'Primed_Shred';
Primed_Shred.FRM = 0.55;

Serration = blank_mod; 
Serration.name = 'Serration';
Serration.DM = 1.65; 

Shred = blank_mod; 
Shred.name = 'Shred';
Shred.FRM = 0.3; 

Speed_Trigger = blank_mod; 
Speed_Trigger.name = 'Speed_Trigger';
Speed_Trigger.FRM = 0.6;

Split_Chamber = blank_mod; 
Split_Chamber.name = 'Split_Chamber';
Split_Chamber.MM = 0.9;

Vile_Acceleration = blank_mod; 
Vile_Acceleration.name = 'Vile_Acceleration';
Vile_Acceleration.FRM = 0.9;
Vile_Acceleration.DM = -0.15;

Vital_Sense = blank_mod; 
Vital_Sense.name = 'Vital_Sense';
Vital_Sense.CMM = 1.2; 

Vigilante_Armaments = blank_mod; 
Vigilante_Armaments.name = 'Vigilante_Armaments';
Vigilante_Armaments.MM = 0.6;

Wildfire = blank_mod;
Wildfire.name = 'Wildfire';
Wildfire.DM = 0.6; 
Wildfire.mM = 0.2;

% create the all mods arsenal array
mods = [
  Serration; %1
  Heavy_Caliber; %2
  Split_Chamber; %3
  Point_Strike; %4
  Vital_Sense; %5
  Primed_Bane_Mod; %6
  Argon_Scope; %7
  Bladed_Rounds; %8
  Elemental_Sixty_1; %9
  Elemental_Sixty_2; %10
  Elemental_Ninety_1; %11
  Elemental_Ninety_2; %12
  Elemental_Ninety_3; %13
  Vigilante_Armaments; %14
  Fast_Hands; %15
  Hammer_Shot; %16
  Magazine_Warp; %17
  Bane_Mod; %18
  Primed_Cryo_Rounds; %19
  Primed_Fast_Hands; %20
  Primed_Shred; %21
  Shred; %22
  Speed_Trigger; %23
  Vile_Acceleration; %24
  Wildfire; %25
  Critical_Delay; %26
  ];
mod_name_arr = {mods.name}';
mods_total = numel(mods);
all_mods = 1:mods_total;