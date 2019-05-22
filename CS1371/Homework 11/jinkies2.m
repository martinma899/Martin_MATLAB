function [name,count] = jinkies2 (str)

    count = 0;
    while true
        if isempty(str.(lastfieldget(str)))
            name = str.(firstfieldget(str));
            return;
        else
            str = str.(lastfieldget(str));
            count = count+1;
        end
    end

end

function [out] = firstfieldget(in)

    fnames = fieldnames(in);
    out = fnames{1};

end

function [out] = lastfieldget(in)

    fnames = fieldnames(in);
    out = fnames{length(fnames)};

end