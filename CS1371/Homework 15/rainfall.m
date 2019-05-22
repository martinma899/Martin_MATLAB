function outsize = rainfall(size,height)

    if height <= 0
        outsize = size;
    elseif size>=4
        height = height-50;
        size = size/2;
        outsize = rainfall(size,height);
    else
        height = height-50;
        size = size*1.5;
        outsize = rainfall(size,height);
    end
        
end

% pass by massive testing