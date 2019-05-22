function [outstruct,miles] = mostWanted(instruct,milelimit)

% First, put everything into a cell
% Write a while loop. First needs to be initialized. 
% by getting the first mileage.
% loop structure:
% - first initialize, get first mileage.
% - while miles <= milelimit
% - 
% - find distance
% - end, repeat

    allcell = onebynstruct2cell(instruct);
    copy = allcell;
    
    count = 1;
    miles = 0;
    position = 'neutral'; % not any of the positions.
    importancevec = cell2mat(copy(:,3));
    [~,sortedindex] = sort(importancevec,'descend');
    topchoicesindex = sortedindex(1:2);
    dist1 = distfromdirection(copy{topchoicesindex(1),2},position);
    dist2 = distfromdirection(copy{topchoicesindex(2),2},position);
    if dist1==dist2
        miles = dist1+miles;
        theoneindex = sortedindex(1);
        position = copy{theoneindex,3};
    elseif dist1>dist2
        miles = dist2+miles;
        theoneindex = sortedindex(2);
        position = copy{theoneindex,3};
    elseif dist1<dist2
        miles = dist1+miles;
        theoneindex = sortedindex(1);
        position = copy{theoneindex,3};
    end
    
    while miles<=milelimit
        % Assign the values to the struct
        outstruct(count) = instruct(theoneindex);
        count = count+1;
        % Then delete the row
        instruct(theoneindex) = [];
        copy(theoneindex,:) = [];
        % Then update the distance
        importancevec = cell2mat(copy(:,3));
        [~,sortedindex] = sort(importancevec,'descend');
        topchoicesindex = sortedindex(1:2);
        dist1 = distfromdirection(copy{topchoicesindex(1),2},position);
        dist2 = distfromdirection(copy{topchoicesindex(2),2},position);
        if dist1==dist2
            miles = dist1+miles;
            theoneindex = sortedindex(1);
            position = copy{theoneindex,3};
        elseif dist1>dist2
            miles = dist2+miles;
            theoneindex = sortedindex(2);
            position = copy{theoneindex,3};
        elseif dist1<dist2
            miles = dist1+miles;
            theoneindex = sortedindex(1);
            position = copy{theoneindex,3};
        end
    end
    
    % Finally, the mile exceeds the limit. Find the previous one.
    miles = miles-min(dist1,dist2);
    
end

function [outcell] = onebynstruct2cell(struct)

    cellraw = struct2cell(struct);
    [a,~,b] = size(cellraw);
    outcell(1:a,1:b) = cellraw(:,1,:);
    outcell = outcell';

end

function [distance] = distfromdirection (direction,current)
    if strcmp(direction,current)
        distance = 50;
    else
        switch direction
            case 'NE'
                distance = 200;
            case 'SE'
                distance = 300;
            case 'MW'
                distance = 500;
            case 'NW'
                distance = 600;
            case 'W'
                distance = 700;
        end
    end
end