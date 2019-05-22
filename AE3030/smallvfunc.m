function [out] = smallvfunc (Mvec,r)
    out = sqrt((r+1)/(r-1))*atand(sqrt((r-1)/(r+1)*(Mvec.^2-1)))...
        -atand(sqrt(Mvec.^2-1));
end