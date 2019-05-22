function plotSquare(vec,l)

    x = [vec(1)-l/2 vec(1)+l/2 vec(1)+l/2 vec(1)-l/2 vec(1)-l/2];
    y = [vec(2)+l/2 vec(2)+l/2 vec(2)-l/2 vec(2)-l/2 vec(2)+l/2];
    
    plot(x,y);

end