function [out] = structDisp (structure)

% get the size of the structure.

% initialize a huge cell with correct size
% in a big nested for loop, do this:
% - do struct2charArr to each single element
% - get the size of the char array
% - if longer than 50, cut down.
% - if shorter than 50, create an empty char array, put 
% - the sorter one in.
% - Put the newly created array into the correct space in the cell array
% exit loop, do cell2mat(cell);

   [a,b] = size(structure);
    allcellarr = cell(a,b);
    for i = 1:a*b
        chararr = struct2charArr(structure(i));
        [as,bs] = size(chararr);
        if bs > 50
            chararr = chararr(:,1:50);
        else
            blank = char(32*ones(as,50));
            blank(:,1:bs) = chararr;
            chararr = blank;
        end
        allcellarr{i} = chararr;
    end

    out = cell2mat(allcellarr);
    
end