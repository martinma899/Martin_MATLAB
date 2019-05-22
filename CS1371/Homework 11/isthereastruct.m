function [bool] = isthereastruct (str)
    fnames = fieldnames(str);
    for i = 1:length(fnames)
        if isstruct(str.(fnames{i}))
            bool = true;
            return
        end
    end
    bool = false;
end