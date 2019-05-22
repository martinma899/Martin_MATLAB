function [result] = isPal(word)

    if length(word) == 1
        result = true;
    elseif length(word) == 2
        result = word(1)==word(2);
    else
        if ~(word(1)==word(end))
            result = false;
        else
            result = isPal(word(2:end-1));
        end
    end
    
end