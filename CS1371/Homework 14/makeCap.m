function [xx,yy,zz] = makeCap (r,coeff)

    r = linspace(0,r,30); % create a range of rs
    t = linspace(0,2*pi,30); % create a range of thetas
    [rr,tt] = meshgrid(r,t); % create rr for every theta and tt for every r
    yy = sin(tt).*rr; % use rr and tt to create x and y grids
    xx = cos(tt).*rr;

     zz = polyval(coeff,rr);

end