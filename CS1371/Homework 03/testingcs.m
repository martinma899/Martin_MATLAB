function [] = testingcs (length, repetitions, index)

    for n = 1:repetitions
        
        str = char(randi(26,1,length)+96);
        str2 = caesarSalad(str,index);
        str3 = caesarSalad_soln(str,index);
        bool = strcmp(str2,str3);
        if bool
            bools = 'true';
        else
            bools = 'false';
        end
        output = sprintf('%s %s %s %s',str,str2,str3,bools);
        disp(output)
        
    end

end