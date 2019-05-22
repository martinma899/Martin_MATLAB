function [visc] = viscosity (T)
  
data = csvread('TvsViscosity.csv');

Tarr = data(:,1);
viscarr = data(:,2);

visc = interp1(Tarr,viscarr,T,'spline');

end