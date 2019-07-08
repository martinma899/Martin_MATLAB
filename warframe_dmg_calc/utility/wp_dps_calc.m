function [avgdps, burstdps] = wp_dps_calc(wp,enemy,dmghtm)
% input: 1. weapon object 2. enemy object
% enemy objects have 3 layers of health: shield, armor, health. 
% if the enemy has any shield, the output dps will be raw dps of the weapon
% not considering any status effect against shield. 
% if the enemy has no shield, the output dps will be raw dps of the weapon
% not considering any status effect against armor. 
% enemy object fields: 
% shield_type, shield_value, armor_type, armor_value, health_type,
% health_value

% get weapon fields
wpfields = fields(wp);

% fix weapon type interactions
if strcmp(wp.trigger,'held')
  wp.MAG = wp.MAG*2;
end

% decide what dps to calculate
if enemy.shield_value>0
  health_type_general = 'shield';
else
  if enemy.armor_value>0
    health_type_general = 'armor+flesh';
  else
    health_type_general = 'flesh';
  end
end

dmg = 0; % initialize per shot damage
for i = 15:24 % iterate through every non zero damage type of the weapon
  % and apply appropriate damage modifier
  switch health_type_general
    case 'shield'
      if wp.(wpfields{i})>0 % if this particular damage type is not 0
        % add this damage type modded with health type modifier
        dmg = dmg+wp.(wpfields{i})*...
          (1+gethtm(wpfields{i},enemy.shield_type,dmghtm));
      end
    case 'flesh'
      if wp.(wpfields{i})>0 % if this particular damage type is not 0
        % add this damage type modded with health type modifier
        dmg = dmg+wp.(wpfields{i})*...
          (1+gethtm(wpfields{i},enemy.health_type,dmghtm));
      end
    case 'armor+flesh'
      if wp.(wpfields{i})>0 % if this particular damage type is not 0
        % add this damage type modded with health type modifier
        % in the case of armor+flesh, perform the combined armor+flesh
        % formula
        dmg = dmg+wp.(wpfields{i})*...
          300/(300+enemy.armor_value*(1-gethtm(wpfields{i},enemy.armor_type,dmghtm)))*...
          (1+gethtm(wpfields{i},enemy.armor_type,dmghtm))*...
        (1+gethtm(wpfields{i},enemy.health_type,dmghtm));
      end
  end
end
% take into account effect of multishot, crit and faction damage mod
dmg = dmg*wp.MS*(1+(wp.CM-1)*wp.CC)*wp.(enemy.faction); 
% compute burst dps and average dps according to formula
burstdps = dmg*wp.FR;
avgdps = dmg/(1/wp.FR+1/(1/wp.RLT+wp.MAG));
end