function out = f (func,in)
    s = size(in);
    out = [in zeros(s(1),1)];
    switch s(2)
        case 2
            for i = 1:s(1)
                x = in(i,1);
                y = in(i,2);
                eval(['out(i,3) = ' func ';']);
            end
        case 3
            for i = 1:s(1)
                x = in(i,1);
                y = in(i,2);
                z = in(i,3);
                eval(['out(i,4) = ' func ';']);
            end
    end
end