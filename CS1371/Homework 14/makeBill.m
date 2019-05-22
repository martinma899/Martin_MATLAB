function [xx,yy,zz] = makeBill (long,r)

    offt = pi/6;
    theta = linspace(offt,pi-offt,20);
    x = linspace(-3,-3-long,10);
    [xx,tt] = meshgrid(x,theta);
    yy = r*cos(tt);
    zz = r*sin(tt)-r*sin(offt);
    
end