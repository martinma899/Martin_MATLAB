clc;clear

Cp0 = -0.54
M = 0.58
r = 1.4
lambda = sqrt(1-M^2)

Cpa = Cp0/lambda
Cpb = Cp0/(lambda+(M^2/(1+lambda))*Cp0/2)
Cpc = Cp0/(lambda+(M^2*(1+(r-1)/2*M^2)/(2*lambda))*Cp0)