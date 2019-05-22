clc;clear

data = dlmread('Figure 4 - true stress and true strain.csv',',',1,0);

stress = data(:,1);
strain = data(:,2);
stress = stress*1e6;
strain = strain*1e-6;

strain(1:2) = [];
stress(1:2) = [];

lnstress = log(stress);
lnstrain = log(strain);

hold off
plot(lnstrain,lnstress,'b.-')

% 141 - 2094

coeffs = polyfit(lnstrain(141:2094),lnstress(141:2094),1)

K = exp(coeffs(2))*1e-6
n = coeffs(1)


hold on
t1 = linspace(-7,-1,101);
y1 = polyval(coeffs,t1);
plot(t1,y1)