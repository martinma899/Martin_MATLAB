function [outcell,totalcost] = thriftyHalloweener (multistruct,character)
%% Make excel name
    xlsname = character;
    xlsname(1) = lower(xlsname(1));
    xlsname(xlsname == ' ') = [];
    xlsname = [xlsname '.xls'];
%% Get excel file
    [~,~,parts] = xlsread(xlsname);
%% Now we can start our huge loop. With some initializations.
    [~,b] = size(multistruct);
    stores = onebynstruct2cell(multistruct);
    stores(:,2:end) = [];
    long = length(parts);
    for i = 1:long
        count = 1;
        for j = 1:b
            storeInventory = onebynstruct2cell(multistruct(j).Inventory);
            whichproduct = find(strcmp(storeInventory(:,1)',parts{i,1}),1);
            if ~isempty(whichproduct)
                thispartoption{count,1} = multistruct(j).Name;
                thispartoption{count,2} = storeInventory{whichproduct,2};
                count = count+1;
            end
        end
        [bestdeal,bestdealindex] = min(cell2mat(thispartoption(:,2)));
        parts{i,2} = thispartoption{bestdealindex,1};
        parts{i,3} = bestdeal;
        thispartoption = [];
    end

    outcell = cell(long+1,3);
    outcell(1,1:3) = [{'Item'} {'Store'} {'Price'}];
    outcell(2:end,:) = parts;
    
    totalcost = sum(cell2mat(parts(:,3)));
    
end

function [outcell] = onebynstruct2cell(struct)

    cellraw = struct2cell(struct);
    [a,~,b] = size(cellraw);
    outcell(1:a,1:b) = cellraw(:,1,:);
    outcell = outcell';

end