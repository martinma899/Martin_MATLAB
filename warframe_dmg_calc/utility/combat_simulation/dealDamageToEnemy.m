function enemy_out = dealDamageToEnemy(enemy_in,damage)
% enemy_in: an enemy struct coming in
% damage: a damage object coming in
% damage object has the following fields: 
% damage.type is a cell array of all damage types
% damage.value is a numerical array of all the damage values
% damage.t is the time of that damage instance
% damage.flag is whether this damage instance has been executed or not

% first, if the enemy has shields
if enemy_in.shield_value > 0
  % iterate through 
end

end