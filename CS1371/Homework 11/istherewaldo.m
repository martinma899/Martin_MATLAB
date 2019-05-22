function [bool] = istherewaldo(str)

    fnames = fieldnames(str);
    
    for i = 1:length(fnames)
        if isequal(str.(fnames{i}),'Waldo')
            bool = true;
            return
        end
    end

    bool = false;

end