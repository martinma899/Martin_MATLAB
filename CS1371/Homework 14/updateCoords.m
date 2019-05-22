function [xxout,yyout,zzout] = updateCoords (xxin,yyin,zzin,coord)

    xxout = xxin+coord(1);
    yyout = yyin+coord(2);
    zzout = zzin+coord(3);

end