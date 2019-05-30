function [ratio] = pratio(M,r)
    ratio = (1+(r-1)/2*M^2)^(r/(r-1));
end