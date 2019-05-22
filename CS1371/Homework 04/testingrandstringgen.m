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