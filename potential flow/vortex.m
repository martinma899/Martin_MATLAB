function [Vx,Vy,phi,psi] = vortex(x,y,x0,y0,Gamma)
[X,Y] = meshgrid(x,y);
X = X-x0;
Y = Y-y0;
R = sqrt(X.^2+Y.^2);
T = angle(X+1i*Y);
Vr = R*0;
Vt = -Gamma./(2*pi*R);
Vx = Vr.*cos(T)-Vt.*sin(T);
Vy = Vr.*sin(T)+Vt.*cos(T);
phi = -Gamma/(2*pi).*T;
psi = Gamma/(2*pi).*log(R);
end