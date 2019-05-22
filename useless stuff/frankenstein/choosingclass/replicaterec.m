function [img] = replicaterec (img,stopsize)

    [a,b] = size(img);
    if a*b>=stopsize^2
    else
        img = [img img; img img];
        img = replicaterec(img,stopsize);
    end
end