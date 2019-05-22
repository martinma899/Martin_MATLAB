function [name,count] = jinkies(str)

    if ~isstruct(str.(lastfieldname(str)))
        name = str.(firstfieldname(str));
        count = 0;
    else
        str = str.(lastfieldname(str));
        [name,count] = jinkies1(str);
        count = count+1;
    end
    
end

    function [out] = firstfieldname(in)
        
        fnames = fieldnames(in);
        out = fnames{1};
        
    end

    function [out] = lastfieldname(in)
        
        fnames = fieldnames(in);
        out = fnames{length(fnames)};
        
    end