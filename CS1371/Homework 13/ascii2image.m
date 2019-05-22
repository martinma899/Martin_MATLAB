function [] = ascii2image(asciiartname,chars,grayscales)

    lines = linecount(asciiartname);
    fid = fopen(asciiartname,'r');
    
    for i = 1:lines
        asciiart(i,:) = fgetl(fid);
    end
    
    I = asciiart*0;
    
    for i = 1:length(chars)
        mask = asciiart==chars(i);
        I(mask) = grayscales(i);
    end
    
    I = uint8(cat(3,I,I,I));
    
    outname = [asciiartname(1:end-4) '.png'];
    imwrite(I,outname);
    imshow(I)
    
end

function n = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end