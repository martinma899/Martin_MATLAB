function [rhymeid] = getrhymeid (string)

    string = lower(string);

    words = length(find(string==' '))+1;
    
    string = string(isletter(string));
    
    last3 = string(end-2:end);
    
    rhymestrid = [words last3];
    
    rhymeid = sum(rhymestrid.^(1:4));
    
end