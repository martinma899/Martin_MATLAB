function [outcell] = onebynstruct2cell(struct)

    cellraw = struct2cell(struct);
    [a,~,b] = size(cellraw);
    outcell(1:a,1:b) = cellraw(:,1,:);
    outcell = outcell';

end