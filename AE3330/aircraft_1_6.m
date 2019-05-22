clc;clear;close all

data = csvread('data_6.csv');

alfa = data(:,1);
CL = data(:,2);

CD0 = 0.023;
K = 0.04;

CD = CD0+CL.^2*K;
AE = CL./CD;

CL_AEmax = sqrt(CD0/K)
AEmax = CL_AEmax/(CD0+K*CL_AEmax^2)

hold on
plot(CL,AE,'b.-')
plot(CL_AEmax,interp1(CL,AE,CL_AEmax,'spline'),'rd')

alfa_AEmax = interp1(CL,alfa,CL_AEmax,'spline')
