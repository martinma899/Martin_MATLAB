function [ratio] = rhoratio(M,r)
    ratio = (1+(r-1)/2*M^2)^(1/(r-1));
end