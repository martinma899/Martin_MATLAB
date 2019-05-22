function [left,num] = choCollatz(in)

    vec = calcvec(in);
    left = vec(end);
    num = length(vec)-1;
    
end

function [out] = calcvec (in)

    if in(end)<2
        out = in;
    else
        out = [in calcvec(nextterm(in))];
    end

end

function [out] = nextterm (n)

    if ~logical(mod(n,2))
        out = n/2;
    else
        out = (3*n+1)/2;
    end

end