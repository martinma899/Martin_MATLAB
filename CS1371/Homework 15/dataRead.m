function [str] = dataRead(fname)

    fid = fopen(fname,'r'); % open file
    
    line1 = fgetl(fid); % get first line, which is the header
    
    [word,rest] = strtok(line1,','); % initialize the loop
    headercell = [];
    str = [];
    
    while ~isempty(rest) % make empty struct and header cell
        str.(word) = [];
        headercell = [headercell {word}];
        [word,rest] = strtok(rest,',');
    end
    
    line = fgetl(fid);
    while ischar(line)
        [numberstr,rest] = strtok(line,',');
        count = 1;
        while ~isempty(rest)
            str.(headercell{count}) = [str.(headercell{count});...
            str2double(numberstr)];
            [numberstr,rest] = strtok(rest,','); 
            count = count+1;
        end
        line = fgetl(fid);
    end
    
    fclose(fid);

end