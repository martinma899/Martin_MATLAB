function [out] = fac(in)

    if in == 0
        out = 1;
        return
    end
    out = in*fac(in-1);