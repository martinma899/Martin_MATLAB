function [thefieldname] = getlastvalidfieldname(struct)

    fnames = fieldnames(struct);
    
    for i = length(fnames):-1:1
        if isstruct(struct.(fnames{i}))
            thefieldname = fnames{i};
            return;
        end
    end
    
    thefieldname = false;

end