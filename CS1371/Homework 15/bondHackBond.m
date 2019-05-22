function [password] = bondHackBond(fname)

    fid = fopen(fname);
    line = fgetl(fid);
    arr = [];
    while ischar(line)
        arr = [arr;line];
        line = fgetl(fid);
    end
    [~,c] = size(arr);
    password = [];
    for i = 1:c
        column = arr(:,i);
        difference = char(abs(diff(column))'+97);
        index = strfind(difference,'aa');
        index = index(1);
        password = [password column(index)];
    end
    
    fclose(fid);

end