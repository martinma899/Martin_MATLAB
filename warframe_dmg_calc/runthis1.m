% a function execution script intended to test multiple things. 

% completed: 

%% house keeping
clear;init_seq;

%% user inputs
weapon_name = 'Amprex'; % weapon name, same as weapon folder name
mod_input_file_name = 'mod_selection_2.txt'; % mod selection input file name
enemy_name = 'scorpion'; % enemy name, same as enemy file name

%% load and process weapon file
addpath(['.\weapons\' weapon_name]); 
wpb = read_weapon_xlsx([weapon_name '.xlsx']);
fprintf('Weapon name: %s\n',weapon_name);
disp(wpb);

%% load mods and display them on screen
[mods,mods_ind,comments] = read_mod_selection(mod_input_file_name);
print_mods(mods,mods_ind,comments,1)

%% load enemy file
enemy = read_enemy_file([enemy_name '.xlsx'],'default');
enemy = enemy{1};
enemy = enemy_scaler(enemy,20)

%% compute all weapon moddings
[wpm_quantum,wpm] = mod_weapon(wpb,mods(mods_ind.mandatory));
disp(wpm);
[avgdps, burstdps, htm, htmeff] = wp_dps_calc(wpm,enemy,dmghtm)

%% clean up
% wrap_up;

