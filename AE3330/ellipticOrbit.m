clc;clear;close all

% this script plots earth and an elliptic orbit, 
% given a and ecc. 

% earth
RE_e = 6378.137e3;
RE_p = 6356.752e3;
RE_m = 6371.008e3;
% mars
% RE_e = 3396.2e3;
% RE_p = 3376.2e3;
% RE_m = 3389.5e3;

a = 500000+RE_m;
ecc = 0;


res = 301;
t = linspace(0,2*pi,res);
% first, compute coordinates of earth. 
xe_e = RE_e*cos(t);
ye_e = RE_e*sin(t);
xe_p = RE_p*cos(t);
ye_p = RE_p*sin(t);
xe_m = RE_m*cos(t);
ye_m = RE_m*sin(t);
% plot earth radii

figure(1)
hold on
plot(xe_e,ye_e,'b-');
plot(xe_p,ye_p,'r-');
plot(xe_m,ye_m,'k-');
axis equal
axis off

% compute orbit
FF = 2*a*ecc;
P = a*(1-ecc^2);
r = P./(1+ecc*cos(t));
x = r.*cos(t);
y = r.*sin(t);
plot(x,y,'k')

% plot points
plot(0,0,'ro')
plot(-FF,0,'bo')

















