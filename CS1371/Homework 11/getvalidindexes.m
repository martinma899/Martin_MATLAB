function [index] = getvalidindexes (str)
    [~,long] = size(str);
    index = [];
    for i = 1:long
        if isstruct(str(1,i).Friends)
            index = [index i];
        end
    end
end