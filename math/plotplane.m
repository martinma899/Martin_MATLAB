R = linspace(0,2);
T = linspace(0,2*pi);

[r,t] = meshgrid(R,T);

x = r.*cos(t);
y = r.*sin(t);
z = 1-1/7*r.*sin(t);

surf(x,y,z,'meshstyle','both','facealpha',0.5,'edgecolor','none')