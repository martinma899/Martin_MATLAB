function [numstolen] = countCelery (cell,totalcrops)

    celllength = length(cell);
    
    for i = 1:celllength
        logic(i) = isequal(cell{i},'celery');
    end
    
    numstolen = totalcrops-sum(logic);

end