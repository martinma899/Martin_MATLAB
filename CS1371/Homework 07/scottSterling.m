% No guly loop used!!! Tada!!! Isn't this beautiful!

function [exhausion] = scottSterling (pos)

    maskx = pos(1,:)>=0&pos(1,:)<=24;
    masky = pos(2,:)>=0&pos(2,:)<=8;
    mask = maskx&masky;
    validposx = pos(1,:);
    validposy = pos(2,:);
    validposx = validposx(mask);
    validposy = validposy(mask);
    
    validposx = [12 validposx];
    validposy = [6  validposy];
    
    diffx = diff(validposx);
    diffy = diff(validposy);
    
    diffxsquared = diffx.^2;
    diffysquared = diffy.^2;
    
    squaresums = diffxsquared+diffysquared;
    
    distances = sqrt(squaresums);
    
    dist = sum(distances);
    
    exhausion = dist/8;
end