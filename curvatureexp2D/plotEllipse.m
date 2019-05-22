
x = linspace(-0.5,0.5,1000)';
y = sqrt(1/16-1/4*x.^2);

yx = -x./sqrt(1-4*x.^2);
yxx = -1./sqrt(1-4*x.^2)-4*x.^2./((1-4*x.^2).^(3/2));

kappa = yxx./((1+yx.^2).^(3/2));
r = abs(1./kappa);

%plot(x,y,'b.-')
plot(x,r,'k-')
axis equal
