function [index] = cellvecfind (cell,element)
    [a,b] = size(cell);
    logic = logical(zeros(a,b));
    long = a*b;
    for i = 1:long
        logic(i) = isequal(cell{i},element);
    end
    index = find(logic);
end