function [xx,yy,hh] = gen_unrot_cone(head_size,head_angle)
rmaxoverhmax = tand(head_angle);
hmax = head_size;
rmax = hmax*rmaxoverhmax;

hres = 5;
thetares = 17;

hvec = linspace(0,hmax,hres);
thetavec = linspace(0,2*pi,thetares);

[hh,tt] = meshgrid(hvec,thetavec);
rr = -rmaxoverhmax*hh+rmax;

xx = rr.*cos(tt);
yy = rr.*sin(tt);

end