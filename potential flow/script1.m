clc;clear;close all;hold on

x = linspace(-2,2,21);
y = linspace(-2,2,21);

% vortex 1
[Vx1,Vy1] = vortex(x,y,0,0,1);
% freestream
[Vx2,Vy2] = freestream(x,y,0.5,0);
% source
[Vx3,Vy3] = doublet(x,y,0,0,1);

Vx4 = Vx1+Vx2+Vx3;
Vy4 = Vy1+Vy2+Vy3;

[X,Y] = meshgrid(x,y);
quiver(X,Y,Vx4,Vy4)
axis equal