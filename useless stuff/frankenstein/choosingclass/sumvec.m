function [result] = sumvec (vec)

    if isempty(vec)
        result = 0;
    else
        result = vec(1)+sumvec(vec(2:end));
    end

end