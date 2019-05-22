function [out] = Fthing (string)

    index = strfind(string,'F');
    indexplus = [index length(string)+1];
    amount = length(index);
    
    if logical(amount)
        out = string(1:index(1)-1);
        for i = 1:amount
            out = [out char(176) string(indexplus(i):indexplus(i+1)-1)];
        end
    else
        out = string;
    end

end