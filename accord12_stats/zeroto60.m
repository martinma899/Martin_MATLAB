clc;clear

% this script calculates 0 to 60 mph time given an acceleration value

a = 0.35; % acceleration in g
g = 32.17405; % g in ft/s/s
% W = 4431; % car weight in lb
% m = W/32.17405; % mass of car in slug
vmax = 60; % mph
vmax_fps = vmax*5280/3600; % ft/s

t = vmax_fps/(a*g)
