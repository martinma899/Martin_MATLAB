function [outarr] = makecolormap (invec,dimvec)

    outarr = ones(dimvec(1),dimvec(2),3);
    for i = 1:3
        outarr(:,:,i) = invec(i);
    end
    outarr = outarr/255;

end