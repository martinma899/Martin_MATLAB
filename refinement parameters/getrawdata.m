function [datathisfile] = getrawdata(filenum)
    filename = sprintf('refinement_parameters%d.out',filenum); 
    fid = fopen(filename,'r');
    datathisfile = [];
    line = fgetl(fid);
    while ischar(line)
        lineinnum = str2num(line);
        datathisfile = [datathisfile;lineinnum];
        line = fgetl(fid);
    end
    fclose(fid);
end