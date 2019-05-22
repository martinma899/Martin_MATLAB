function [coords] = produceNonLinspaceEllipse(a,b,minNumPts)
    % nonlinearity is random
    maxStep = 2*pi/minNumPts;
    coords = [];
    thist = 0;
    while thist<2*pi
        x = a*cos(thist);
        y = b*sin(thist);
        coords = [coords;x y];
        thist = thist+maxStep*rand();
    end
    coords = [coords;a,0];

end