function [name] = australianSecretAgent (memo)

    lines = linecount(memo);

    fid = fopen(memo,'r');
    
    for i = 1:lines
        [name{i},words{i}] = strtok(fgetl(fid));
        name{i} = name{i}(1:end-1);
        words{i} = lower(words{i}(3:end));
    end
    
    guy1name = name{1};
    guy2name = name{2};
    
    guy1 = 0;
    guy2 = 0;
    
    for i = 1:lines
        thisname = name{i};
        switch thisname
            case guy1name
                guy1 = guy1+countKeyWords(words{i});
            case guy2name
                guy2 = guy2+countKeyWords(words{i});
        end
    end
    
    if guy1>guy2
        name = guy1name;
    else
        name = guy2name;
    end
    
    fclose('all');

end

function [n] = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end

function [num] = countKeyWords (str)

    %‘prawn’, ‘barbie’, and ‘ripper’ 
    
    prawn = length(strfind(str,'prawn'));
    barbie = length(strfind(str,'barbie'));
    ripper = length(strfind(str,'ripper'));
    
    num = prawn+barbie+ripper;
end