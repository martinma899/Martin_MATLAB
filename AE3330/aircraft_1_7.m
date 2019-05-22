clc;clear;close all

data = csvread('data_6.csv');

ind = [1 6 11 16];
data = data(ind,:);

alfa = data(:,1);
CL = data(:,2);

CD0 = 0.023;
K = 0.04;

CD = CD0+CL.^2*K;

g = 9.81;

data2 = csvread('hvsdens.csv');
harr = data2(:,1);
rhoarr = data2(:,2);

% cessna case
disp('cessna 152')
h = 4000;
rho = interp1(harr,rhoarr,h,'spline')
S = 14.9;
m = 757;
v = 55;
mg = m*g
L = 0.5*rho*v^2*S*CL;
D = 0.5*rho*v^2*S*CD;
disp([alfa L D])

% gulfstream
disp('Gulfstream III')
h = 13000;
rho = interp1(harr,rhoarr,h,'spline')
S = 86.8;
m = 31615;
v = 227;
mg = m*g
L = 0.5*rho*v^2*S*CL;
D = 0.5*rho*v^2*S*CD;
disp([alfa L D])

% lockheed
disp('Lockneed P-3 Orion')
h = 10000;
rho = interp1(harr,rhoarr,h,'spline')
S = 120.8;
m = 64400;
v = 170;
mg = m*g
L = 0.5*rho*v^2*S*CL;
D = 0.5*rho*v^2*S*CD;
disp([alfa L D])





















