clc;clear;close all;hold on

x = linspace(-2,2,201);
y = linspace(-2,2,201);

[Vx,Vy,phi,psi] = freestream(x,y,1,0);
[Vx2,Vy2,phi2,psi2] = doublet(x,y,0,0,1);

phi3 = phi+phi2;
psi3 = psi+psi2;
Vx3 = Vx+Vx2;
Vy3 = Vy+Vy2;

mag = sqrt(Vx3.^2+Vy3.^2);
mask = mag>=1;
Vx3(mask) = Vx3(mask)./mag(mask);
Vy3(mask) = Vy3(mask)./mag(mask);
mag(mask) = 1;

[X,Y] = meshgrid(x,y);
%pcolor(X,Y,mag)
quiver(X,Y,Vx3,Vy3)
contour(X,Y,psi3,300)
%contour(X,Y,phi3,100)
axis equal

% draw the circle
t = linspace(0,2*pi,101);
r = sqrt(1/(2*pi));
xc = r*cos(t);
yc = r*sin(t);
plot(xc,yc,'r-')

% figure(2)
% surf(X,Y,phi3)
% xlabel('x')







