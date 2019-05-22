function [Vx,Vy,phi,psi] = source(x,y,x0,y0,Q)
[X,Y] = meshgrid(x,y);
X = X-x0;
Y = Y-y0;
R = sqrt(X.^2+Y.^2);
T = angle(X+1i*Y);

Vr = Q./(2*pi*R);
Vt = 0*R;
Vx = Vr.*cos(T)-Vt.*sin(T);
Vy = Vr.*sin(T)+Vt.*cos(T);
phi = Q/(2*pi)*log(R);
psi = Q/(2*pi)*T;
end