function [Vx,Vy,phi,psi] = freestream(x,y,vinf,theta)
% theta in degrees
[X,Y] = meshgrid(x,y);
onesmat = 0*X+1;
Vx = onesmat*cosd(theta)*vinf;
Vy = onesmat*sind(theta)*vinf;
phi = Vx.*X+Vy.*Y;
psi = Vx.*Y-Vy.*X;
end