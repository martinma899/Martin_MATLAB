%% house keeping
clear

%% load mods and base weapon
load_mods;
load_base_weapon;

% --> Mod Numbering System <-- 
%{
 1             Serration   DM  +1.65 
 2         Heavy_Caliber   DM  +1.50 
 3         Split_Chamber   MM  +0.90 
 4          Point_Strike  CCM  +1.50 
 5           Vital_Sense  CMM  +1.20 
 6       Primed_Bane_Mod  FDM  +0.45 
 7           Argon_Scope  CCM  +1.35 
 8         Bladed_Rounds  CMM  +1.20 
 9     Elemental_Sixty_1   DM  +0.60 
10     Elemental_Sixty_2   DM  +0.60 
11    Elemental_Ninety_1   DM  +0.90 
12    Elemental_Ninety_2   DM  +0.90 
13    Elemental_Ninety_3   DM  +0.90 
14   Vigilante_Armaments   MM  +0.60 
15            Fast_Hands RLSM  +0.30 
16           Hammer_Shot  CMM  +0.60 
17         Magazine_Warp   mM  +0.30 
18              Bane_Mod   DM  +0.30 
19    Primed_Cryo_Rounds   DM  +1.65 
20     Primed_Fast_Hands RLSM  +0.55 
21          Primed_Shred  FRM  +0.55 
22                 Shred  FRM  +0.30
23         Speed_Trigger  FRM  +0.60 
24     Vile_Acceleration   DM  -0.15   FRM  +0.90 
25              Wildfire   DM  +0.60    mM  +0.20 
26        Critical_Delay  FRM  -0.36   CCM  +0.48 
%}

%% choose mandatory mods and excluded mods(to reduce computation time)
mandatory_mods_arr = [1 26];
excluded_mods_arr = [2 7 8 9 10 13 18 19 20 21 23 24];

mandatory_mods_arr = sort(unique(mandatory_mods_arr));
excluded_mods_arr = sort(unique(excluded_mods_arr));
flexible_mods_arr = setdiff(all_mods,[mandatory_mods_arr excluded_mods_arr]);

fid = 1;
print_mods;

%% computation
%display_mods;
compute_all_builds;

dmg_threshold = 0.7; % output builds that are within 70% of top average dps
sort_criteria = 'average'; % sort by average or burst dps

rank_builds_and_output;

%% write builds to text
histogram([wp_arr.avg_dps])
filename = 'critical_delay_builds.txt';
fid = fopen(filename,'w+');
print_mods;
print_builds;

