function [outvec] = countcell (cell)

    for i = 1:length(cell)
        element = cell{i};
        for j = 1:length(cell)
            logic(j) = isequal(element,cell{j});
        end
        outvec(i) = sum(logic);
    end 

end