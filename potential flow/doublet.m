function [Vx,Vy,phi,psi] = doublet(x,y,x0,y0,mew)
[X,Y] = meshgrid(x,y);
X = X-x0;
Y = Y-y0;
R = sqrt(X.^2+Y.^2);
T = angle(X+1i*Y);

Vr = -mew/(2*pi)*cos(T)./(R.^2);
Vt = -mew/(2*pi)*sin(T)./(R.^2);
Vx = Vr.*cos(T)-Vt.*sin(T);
Vy = Vr.*sin(T)+Vt.*cos(T);
phi = mew/(2*pi)*cos(T)./R;
psi = -mew/(2*pi)*sin(T)./R;
end