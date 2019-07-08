%% house keeping
clear;
initialization_sequence;

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
addpath(weapon_name); load([weapon_name '.mat']); 
% load mods and display them on screen
[mods,mods_ind,comments] = read_mod_selection(mod_input_file_name);
print_mods(mods,mods_ind,comments,1)


%% computation
[all_builds] = generate_all_mod_combs(mods_ind,8);
wp_arr = compute_all_builds(wpb,mods,all_builds,true);

% rank_builds_and_output;
% 
% %% plot things and write builds to text
% plot_things;
% fid = fopen(full_output_file_name,'w+');
% print_mods(mods,mods_ind,comments,fid);
% print_builds;

%% clean up
wrap_up;

