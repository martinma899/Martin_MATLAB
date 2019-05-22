function [ratio] = np0ratio (M1,r)
    ratio = (((r+1)/2*M1^2)/(1+(r-1)/2*M1^2))^(r/(r-1))...
        *(2*r/(r+1)*M1^2-(r-1)/(r+1))^(1/(1-r));
end