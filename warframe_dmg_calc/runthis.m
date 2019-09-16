% to-do list: 
% 1. Implement elemental mod permutation feature so that all possible
% unique modding combinations can be taken into account
% 2. Implement user interface method to look up any enemy within any
% category with ease (a lot of pathing work)
% 3. Implement instantaneous dps calculation for all modded weapons against
% all selected enemies, and design the output format
% 4. Experiment with combat simulation and expand upon existing work and
% enable combat simulation kill time calculation to work with the prevous
% code
% 5. Implement weapon ranking and sorting criteria (a lot of design work)
% 6. Add features such as arcanes and warframe abilities and headshots that
% also influence the performance of a weapon, but separate from the main
% mods user interface because they are not mods
% 7. Add in weapon databse, complete mod database and complete enemy 
% database. 
% 8. Think about what to do with punch-through. 
% 9. Implement crit enhancement algorithm from the much hated vigilante
% armaments
% 10. Rework weapon input format and the entire IO system so they work with
% both text file and excel .xlsx format

% completed: 

%% house keeping
clear;init_seq;

%% user inputs
weapon_name = 'Amprex'; % weapon name, same as weapon folder name
mod_input_file_name = 'mod_selection_2.txt'; % mod selection input file name
output_file_name = 'output_5.txt'; % write build outputs to which file
% sort_criteria = 'average'; % sort by average or burst dps
% dmg_threshold = 0.7; % output builds that are within 70% of top average dps

%% load mods and base weapon
% if the output file exists, asks if intend to overwrite it
query_file_overwrite; 
% load and process weapon file
addpath(['.\weapons\' weapon_name]); 
wpb = read_weapon_xlsx([weapon_name '.xlsx']);
fprintf('Weapon name: %s\n',weapon_name);
disp(wpb);
% load mods and display them on screen
[mods,mods_ind,comments] = read_mod_selection(mod_input_file_name);
print_mods(mods,mods_ind,comments,1)


%% compute all weapon moddings
[all_builds] = generate_all_mod_combs(mods_ind,8);
[wp_quantum_arr,wp_arr] = compute_all_builds(wpb,mods,all_builds,true);

%% compute all weapon performances against various types of enemies

% rank_builds_and_output;
% 
% %% plot things and write builds to text
% plot_things;
% fid = fopen(full_output_file_name,'w+');
% print_mods(mods,mods_ind,comments,fid);
% print_builds;

%% clean up
% wrap_up;

