function out = f (in,der)
    switch der
        case 0
            out=(in.^2-3)./in.^3;
        case 1
            out = -1./in.^2+9./in.^4;
        case 2
            out = 2./in.^3-36./in.^5;
    end
end