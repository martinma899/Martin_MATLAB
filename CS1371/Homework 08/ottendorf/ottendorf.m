function [out] = ottendorf (references,cipher)

    cipherid = fopen(cipher,'r');
    
    out = [];
    
    while 1
        line = fgetl(cipherid);
        
        if strcmp(line,'0-0-0-0')
            break
        elseif length(line)>1
            line(line=='-')=' ';
            line = str2num(line);
            frname = [references '_' num2str(line(1)) '.txt'];
            frid = fopen(frname,'r');
            
            for j = 1:line(2)
                refline = fgetl(frid);
            end
            
            letterindex = [1 find(refline==' ')+1];
            letter = refline(letterindex(line(3))+line(4)-1);
                
        elseif isequal(line,[])
            letter = ' ';
        else
            letter = line;
        end
        
        out = [out letter];
        
    end
    
    fclose('all');

end