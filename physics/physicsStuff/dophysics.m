%% Clear everything
clc
clear

%% values
m = 92.2;
T = 1.74;

%% Do calculation
omega = 2*pi/T;
k = m*9.8/(2*0.0517);

m2 = 2*k/omega^2-m