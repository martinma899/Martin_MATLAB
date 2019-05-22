function [string,rupee] = templeOfTime (pos,directionarr,distarr,letterarr,rupeearr)
    
    % make initial coordinates
    [a,b] = size(directionarr);
    c = pos(2);
    r = pos(1);
    
    % collect things, make new strings, add rupee. (initialize)
    string = [];
    rupee = 0;
    
    % making new coordinates
    direction = directionarr(r,c); % we don't use direction and dist here.
    distance = distarr(r,c);  % we are just initializing them for iteration
    
    while ~isequal(direction,'D');
        
        % First thing is to collect!
        string = [string letterarr(r,c)];
        rupee = rupee+rupeearr(r,c);
        
        % Second thing is difficult... make coordinates...
        direction = directionarr(r,c);
        distance = distarr(r,c);
        
        % debugging use
        %oldcoord = [r c];
        %disp(['old coordinate:' num2str(oldcoord)]);
        %disp(['direction:' num2str(direction)]);
        %disp(['distance:' num2str(distance)]);
        %disp(['dimension:' num2str([a b])]);
        
        [r,c] = coordupdate(r,c,direction,distance,a,b);
        
        % debugging use
        %newcoord = [r c];
        %disp(['new coordinate:' num2str(newcoord)]);
        %disp(' ');
    end
    
    % Collect things on D.. but somehow the solution file does not collect
    % things on D. So don't do it.
    %string = [string letterarr(r,c)];
    %rupee = rupee+rupeearr(r,c);

end

function [newrow,newcol] = coordupdate (r,c,direction,distance,a,b)
    
    switch direction
        case 'N'
            r = mod(r-distance-1,a)+1;
        case 'S'
            r = mod(r+distance-1,a)+1;
        case 'W'
            c = mod(c-distance-1,b)+1;
        case 'E'
            c = mod(c+distance-1,b)+1;
    end

    newrow = r;
    newcol = c;

end