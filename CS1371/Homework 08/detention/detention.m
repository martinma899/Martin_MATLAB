function [outstr] = detention (filename,sentence)

    fid = fopen(filename,'r');
    
    logvec = [];
    
    line = fgetl(fid);
    index = 1;
    
    while ~isequal(line,-1)
        logvec(index) = isequal(line,sentence);
        index = index+1;
        line = fgetl(fid);
    end
    
    goodstr = 'Good job. You are free to go!';
    badstr = 'Not so fast. Start all over!';
    
    logvec = all(logvec);
    
    if logvec
        outstr = goodstr;
    else
        outstr = badstr;
    end
    
    fclose(fid);
    
end