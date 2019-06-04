%% house keeping
clear

%% load mods and base weapon
load_mods;
load_base_weapon;

% --> Mod Numbering System <-- 
%{
 1           Hornet_Strike   DM  +2.20 
 2            Magnum_Force   DM  +1.35 
 3        Barrel_Diffusion   MM  +1.20 
 4          Lethal_Torrent   MM  +0.60   FRM  +0.60 
 5    Primed_Pistol_Gambit  CCM  +1.53 
 6   Primed_Target_Cracker  CMM  +0.90 
 7               Expel_Mod  FDM  +0.30 
 8        Primed_Expel_Mod  FDM  +0.45 
 9              Augur_Pact   DM  +0.90 
10       Elemental_Sixty_1   DM  +0.60 
11       Elemental_Sixty_2   DM  +0.60 
12      Elemental_Ninety_1   DM  +0.90 
13      Elemental_Ninety_2   DM  +0.90 
14      Elemental_Ninety_3   DM  +0.90 
15      Primed_Elemental_1   DM  +1.35 
16      Primed_Elemental_2   DM  +1.35 
17              Gunslinger  FRM  +0.72 
18          Anemic_Agility   DM  -0.15   FRM  +0.90 
19               Quickdraw RLSM  +0.48 
20        Primed_Quickdraw RLSM  +0.72 
21           Slip_Magazine   mM  +0.30 
22    Primed_Slip_Magazine   mM  +0.45 
23       Creeping_Bullseye  FRM  -0.36   CCM  +0.48 
24            Hollow_Point   DM  -0.15   CMM  +0.60 
25    Hydrhaulic_Crosshair  CCM  +1.35 
26       Sharpened_Bullets  CMM  +0.75 
27               Ice_Storm   DM  +0.40    mM  +0.40 
28          Stunning_Speed RLSM  +0.40 
29            Tainted_Clip RLSM  -0.30    mM  +0.60 
%}

%% choose mandatory mods and excluded mods(to reduce computation time)
mandatory_mods_arr = [1 12 27];
excluded_mods_arr = [8 9 10 11 13 14 15 16 20 22 23 25 26];

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
filename = 'ice_storm_viral.txt';
fid = fopen(filename,'w+');
print_mods;
print_builds;

