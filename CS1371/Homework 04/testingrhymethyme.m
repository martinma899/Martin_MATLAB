function [] = testingrhymethyme (repetition,howmanywords1,howmanywords2,wordlengthrange1,wordlengthrange2,display)

    for a = 1:repetition

        isnumofwordsequal = logical(randi([0,1],1));
        isendrhyme = logical(randi([0,1],1));
    
        if isnumofwordsequal
            testingstring = testingrandstringgen (howmanywords1,howmanywords1,wordlengthrange1,wordlengthrange2,isendrhyme);
        else
            testingstring = testingrandstringgen (howmanywords1,howmanywords2,wordlengthrange1,wordlengthrange2,isendrhyme);
        end
    
        if isnumofwordsequal
            snumofwordsequal = 'Number of words are not equal.';
        else
            snumofwordsequal = 'Number of words are not equal.';
        end

        if isendrhyme
            sendrhyme = 'End rhymes.';
        else
            sendrhyme = 'End does not rhyme.';
        end
        
        log1 = rhymeThyme(testingstring);
        log2 = rhymeThyme_soln(testingstring);
        
        if log1
            slog1 = 'User''s program outputs true.';
        else
            slog1 = 'User''s program outputs false.';
        end
        
        if log2
            slog2 = 'Solution is true.';
        else
            slog2 = 'Solution is false.';
        end
        
        if log1 == log2
            output = 'True';
        else
            output = 'Shit... Oh holy crap something''s messed up...';
        end
        
        if display
        disp(' ');
        disp(testingstring);
        disp(snumofwordsequal);
        disp(sendrhyme);
        disp(slog1);
        disp(slog2);
        end
        
        disp(output);
        
    end
    
end

function [string] = testingrandstringgen (howmanywords1,howmanywords2,wordlengthrange1,wordlengthrange2,last3equal)

    string1 = [];
    string2 = [];

    for i = 1 : howmanywords1
        
        oneword = char(randi([97,122],1,randi([wordlengthrange1,wordlengthrange2],1)));
        string1 = [string1 ' ' oneword];
        
    end

    for i = 1 : howmanywords2
        
        oneword = char(randi([97,122],1,randi([wordlengthrange1,wordlengthrange2],1)));
        string2 = [string2 ' ' oneword];
        
    end
    
    string1(2) = char(string1(2)-32);
    string2(2) = char(string2(2)-32);
    
    if last3equal
        string1(end-2:end) = string2(end-2:end);
    else
        while string1(end-2:end) == string2(end-2:end)
            
                for i = 1 : howmanywords2
        
                oneword = char(randi([97,122],1,randi([wordlengthrange1,wordlengthrange2],1)));
                string2 = [string2 ' ' oneword];
        
                end
                
        end
    end
    
    string = [string1(2:end) '. ' string2(2:end) '.'];
    
end