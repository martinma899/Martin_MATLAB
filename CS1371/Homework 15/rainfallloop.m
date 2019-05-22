function outsize = rainfallloop(size,height)

    while true
        height = height-50;
        size = size*1.5;
        if height<=0
            outsize = size;
            return
        end
        if size>=4
            size = size/2;
        end
    end

end