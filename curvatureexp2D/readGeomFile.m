function [arrayout] = readGeomFile(filename)

    fid = fopen(filename);
    arrayout = [];
    line = fgetl(fid);
    while ischar(line)
        arrayout = [arrayout;str2num(line)];
        line = fgetl(fid);
    end

end