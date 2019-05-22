function drawline(slope,length,position)

    % find a rudimentary x,y vector, assuming x=1, y=slope,
    vec = [1,slope];
    % the scale it correctly to a half of unit length
    vec = 0.5*vec/norm(vec);
    % scale it by length
    vec = vec*length;
    % find the other half of the vector
    negvec = -vec;
    % offset both of them
    vec = vec+position;
    negvec = negvec+position;
    % plot both of the vectors
    hold on
    plot([vec(1) negvec(1)],[vec(2) negvec(2)],'b-');
    hold off

end