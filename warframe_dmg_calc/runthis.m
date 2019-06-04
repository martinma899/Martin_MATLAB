%% house keeping
clear;addpath('utility')

%% user inputs
weapon_name = 'Lex_Prime'; % weapon name, same as weapon folder name
mod_input_file_name = 'mod_selection_1.txt'; % mod selection input file name
output_file_name = 'output_1.txt'; % write build outputs to which file
sort_criteria = 'average'; % sort by average or burst dps
dmg_threshold = 0.7; % output builds that are within 70% of top average dps

%% load mods and base weapon
% if the output file exists, asks if intend to overwrite it
query_file_overwrite; 
% load and process weapon file
addpath(weapon_name); process_base_weapon;
% load mods and display them on screen
read_mod_selection; fid = 1; print_mods;

%% computation
compute_all_builds;rank_builds_and_output;

%% plot things and write builds to text
plot_things;
fid = fopen(full_output_file_name,'w+');print_mods;print_builds;

%% clean up
rmpath('utility');rmpath(weapon_name);
