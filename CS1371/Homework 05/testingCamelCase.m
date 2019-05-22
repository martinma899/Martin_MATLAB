function [] = testingCamelCase (wordlengthrange,wordamountrange,repetitions,display)

    for i = 1:repetitions
        
        tstring = '';
        
        for j = 1:randi(wordamountrange);
            
            cap = logical(randi([0 1]));
            
            if cap
                word = char(randi([65 90],1,randi(wordlengthrange)));
            else
                word = char(randi([97 122],1,randi(wordlengthrange)));
            end
            
            tstring = [tstring ' ' word];
            
        end
        
        tstring = tstring(2:length(tstring));
        tstring = [tstring '.'];
        
        [out1] = camelCase (tstring);
        [out2] = camelCase_soln (tstring);
        
        if strcmp(out1,out2)
            bools = 'Great job!';
        else
            bools = 'Crappppp... I hate this problem...';
        end
        
        if ~display
            disp(bools);
        else
            disp(tstring);
            disp(out1);
            disp(out2);
            disp(bools);
            disp(' ');
        end
            
        
    end

end