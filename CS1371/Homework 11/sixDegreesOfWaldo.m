function [bool,depth] = sixDegreesOfWaldo (str)

    if istherewaldo(str)
        bool = true;
        depth = 0;
    else
        if isthereastruct(str)
            indexes = getvalidindexes(str);
            logivec = [];
            for a = length(indexes)
                [temp,depth] = sixDegreesOfWaldo(str(1,a).Friends);
                logivec = [logivec temp];
            end
            bool = any(logivec);
        else
            bool = false;
            depth = 0;
        end
        depth = depth+1;
    end

end

function [bool] = istherewaldo(str)
    fnames = fieldnames(str);
    [~,long] = size(str);
    for i = 1:length(fnames)
        for j = i:long
            if isequal(str(1,j).(fnames{i}),'Waldo')
                bool = true;
                return
            end
        end
    end
    bool = false;
end

function [bool] = isthereastruct (str)
    [~,long] = size(str);
    for i = 1:long
        if isthereastructsub(str(1,i))
            bool = true;
            return
        end
    end
    bool = false;
end

function [bool] = isthereastructsub (str)
    fnames = fieldnames(str);
    for i = 1:length(fnames)
        if isstruct(str.(fnames{i}))
            bool = true;
            return
        end
    end
    bool = false;
end

function [index] = getvalidindexes (str)
    [~,long] = size(str);
    index = [];
    for i = 1:long
        if isstruct(str(1,i).Friends)
            index = [index i];
        end
    end
end