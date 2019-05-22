
x = linspace(0,10000,100000);
y = 1./(x.^2+16);
yy = cumtrapz(x,y);
plot(x,yy)
