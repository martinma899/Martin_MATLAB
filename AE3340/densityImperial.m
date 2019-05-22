function [out] = densityImperial(in)

data = csvread('hvsdens.csv');

data = data(2:12,:);

h = data(:,1);
rho = data(:,2);

out = interp1(h,rho,in,'spline')*1e-4;

end