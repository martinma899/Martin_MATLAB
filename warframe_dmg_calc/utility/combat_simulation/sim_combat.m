function [out_struct] = sim_combat(wp,enemy)
% input 1: wp, a weapon struct according to the convention of this project.
% The weapon should be fully modded.
% input 2: enemy, an enemy struct according to the convention of this
% project. The enemy should already be leveled properly. 
% output 1: out_struct, the combat history of the simulation with three
% fields each containing time dependent data. 
% field 1: t, the time stamps. 
% field 2: enemy, a struct array of the enemy at every time stamp. 
% field 3: event, a string cell array describing what is happening at each
% time stamp. 
% output 2: whether the enemy has been killed or not. 

% emergency: in the mod weapon function, add toxin, electricity, heat,
% slash multipliers for status dot application calculation. 

% psudo code

% do stuff do stuff before stuff begin
main_schedule = [];
electricity_procs = [];
heat_procs = [];
gas_procs = [];
toxin_procs = [];
slash_procs = [];
corrosive_procs = [];
viral_procs = [];

wp_currrent_mag = wp.MAG;
wp_firing_dt = 1/wp.FR;

% take care of some multishot RNG work
if ceil(wp.MS)==floor(wp.MS)
  MS = wp.MS;
  MSRand = false;
else
  MSRandVar.x = [floor(wp.MS) ceil(wp.MS)];
  MSRandVar.p = [1-(wp.MS-floor(wp.MS)) wp.MS-floor(wp.MS)];
  MSRand = true;
end

% take care of some crit RNG work
base_crit_tier = floor(wp.CC);
CritRandVar.x = [1 0];
CritRandVar.p = [wp.CC-floor(wp.CC) 1-(wp.CC-floor(wp.CC))];

% main loop that executes scheduled events in order and keeps creating new
% main events once all main events have been executed;
while true

% Create the next shot main events. 
% roll multishot rng
if MSRand
  MS = rollRandVariable(MSRandVar);
end

% for every projectile
for j = 1:MS
  % roll crit chance rng
  crit_tier = base_crit_tier+rollRandVariable(CritRandVar);
  % record main projectile final damages as separated by elemental types
  % roll status chance rng
  % record status effect and time stamp, create status dot array if
  % applicable
end

% main dynamic event execution loop

while true 
  % search the earliest time entries of all event schedules
  % find all with the same earliest time
  % schedule the events in order of: main projectile damage ticks,
  % corrosive and viral, and then all other dot ticks. 
  % flag these events for having been executed. 
  for i = 1:100
    % apply all events scheduled at this instant one by one. 
  end
  % if enemy is dead
  if enemy.health<=0
    enemy_dead = true; % set enemy dead flag to be true
  end
  % if we are at the end of the current main event schedule,
  if true
    break; % break and loop back and schedule the next main shot
  end
end

if enemy_dead % if enemy is dead, break out of the main loop. 
  break;
end

end

end