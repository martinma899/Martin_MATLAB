function [updatedstruct] = zoesStrizzatta (originalstruct,substitute)

    [~,s] = size(originalstruct);
    updatedstruct = originalstruct;
    
    for i = 1:s
        ingredientname = originalstruct(i).Ingredients;
        logic = strcmp(substitute(:,1),ingredientname);
        if any(logic)
            updatedstruct(i).Ingredients = substitute{logic,2};
            updatedstruct(i).Costs = substitute{logic,3};
        else
        end
    end

end