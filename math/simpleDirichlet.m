clc;clear;close all

rres = 101;
tres = 101;

r = linspace(0,1,rres);
t = linspace(0,2*pi,tres);

[rr,tt] = meshgrid(r,t);

uu = -1+2*rr.*cos(tt)+5*rr.^3.*sin(3*tt);

xx = rr.*cos(tt);
yy = rr.*sin(tt);

surf(xx,yy,uu)

% poisson's method

uualt = uu*0;
intv = 1001;
phi = linspace(0,2*pi,intv);
a = 1;

for i = 1:numel(rr)
    ri = rr(i);
    ti = tt(i);
    func = 1/(2*pi)*(a^2-ri^2).*(-1+2*cos(phi)+5*sin(3*phi))...
      ./(a^2+ri^2-2*a*ri*cos(ti-phi));
    uualt(i) = trapz(phi,func);
end
hold on
plot3(xx,yy,uualt,'r.')
axis([-1 1 -1 1 min(min(uu)) max(max(uu))]);
