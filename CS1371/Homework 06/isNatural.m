function [boo] = isNatural (input)

    if isa(input,'double');
        boo = isequal(input,abs(round(input)));
    else
        boo = false;
    end

end