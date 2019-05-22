clc;clear

data = dlmread('Figure 4 - true stress and true strain.csv',',',1,0);

stress = data(:,1);
strain = data(:,2)/1e6;

[maxstress,ind] = max(stress)
maxstrain = strain(ind)

fracturestress = 303.2787126
fracturestrain = 16.74701519


