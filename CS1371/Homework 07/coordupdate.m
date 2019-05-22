function [newrow,newcol] = coordupdate (r,c,direction,distance,a,b)

    switch direction
        case 'N'
            r = r+mod(-distance,a);
        case 'S'
            r = r+mod(distance,a);
        case 'W'
            c = c+mod(-distance,b);
        case 'E'
            c = c+mod(distance,b);
    end
    
    newrow = r;
    newcol = c;

end