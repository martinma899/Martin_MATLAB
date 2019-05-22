function [] = testingcs (length, repetitions, index)

    for n = 1:repetitions
        
        str = char(randi(100,1,length)+60);
        str2 = caesarCipher(str,index);
        str3 = caesarCipher_soln(str,index);
        bool = strcmp(str2,str3);
        if bool
            bools = 'true';
        else
            bools = 'false';
        end
        output = sprintf('%s %s %s %s',bools,str,str2,str3);
        disp(output)
        
    end

end