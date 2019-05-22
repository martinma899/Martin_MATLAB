function [coords] = produceNonLinspaceEllipse2(a,b,maxStep,maxPts)
    % the spacing of pi keeps decreasing
    coords = [];
    thist = 0;
    count = 1;
    while (thist<2*pi&&count<=maxPts)
        x = a*cos(thist);
        y = b*sin(thist);
        coords = [coords;x y];
        thist = thist+maxStep;
        maxStep = maxStep*0.95;
        count = count+1;
    end
    coords = [coords;a,0];
end