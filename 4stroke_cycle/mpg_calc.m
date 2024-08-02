clc;clear

HP = 70; % horsepower
BSFC = 0.5; % 0.45 - 0.5
r = 0.4; % fuel input rate
gal_gas_weight = 6.152; % weight of a lb of gas
V = 80; % mph

fmax = HP*BSFC % max fuel flow rate lb/hr
mpg = V/fmax/r*gal_gas_weight