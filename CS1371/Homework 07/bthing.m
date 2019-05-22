function [out] = bthing (string)

    index = strfind(string,'b');
    indexplus = [strfind(string,'b') length(string)];
    amount = length(index);
    
    if logical(amount)
        out = string(1:index(1));
        for i = 1:amount
            out = [out char(223) string(indexplus(i)+1:indexplus(i+1))];
        end
    else
        out = string;
    end

end