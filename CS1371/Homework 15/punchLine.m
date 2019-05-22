function [punchline] = punchLine (fname)

    fid = fopen(fname,'r');
    
    % initialize things
    keywordarr = {'side' 'duck' 'girl'};
    punchlinearr = {'To get to the other side!'
                    'To get away from the duck!'
                    'To see about a girl!'};
    line = fgetl(fid);
    counts = [0 0 0];
    
    while ischar(line)
        % count three words and add
        for i = 1:3
            counts(i) = counts(i) + length(strfind(line,keywordarr{i}));
        end
        % get new line
        line = fgetl(fid);
    end

    % aftermath
    [~,whichline] = max(counts);
    
    punchline = punchlinearr{whichline};
    
    fclose(fid);
    
end