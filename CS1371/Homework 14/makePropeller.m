function [xx,yy,zzsingle] = makePropeller (xmin,xmax,r)

    theta = linspace(0,pi,10);
    x = linspace(xmin,xmax,20);
    [xx,tt] = meshgrid(x,theta);
    rr = sin(pi*xx/abs(xmin))*r;
    yy = rr.*cos(tt);
    zzsingle = xx*0+7;

end