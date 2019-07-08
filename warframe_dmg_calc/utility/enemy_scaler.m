function [enemy_out] = enemy_scaler(base_enemy,level)
enemy_out = base_enemy;
enemy_out.level = level;
if base_enemy.shield_value>0
  enemy_out.shield_value = ...
    base_enemy.shield_value*(1+(level-base_enemy.level)^2*0.0075);
end
if base_enemy.armor_value>0
  enemy_out.armor_value = ...
    base_enemy.armor_value*(1+(level-base_enemy.level)^1.75*0.005);
end
if base_enemy.health_value>0
  enemy_out.health_value = ...
    base_enemy.health_value*(1+(level-base_enemy.level)^2*0.015);
end
end