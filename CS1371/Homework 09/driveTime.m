function [outarr] = driveTime (xlsxname)
%% Read data from excel file and reshape data into row vectors
    % successful
% because I feel like doing it.

    [data,~,~] = xlsread(xlsxname);
    timestamps = data(:,1)';
    carids = data(:,2)';


%% Find all unique car ids 
    % successful
    uniquecarids = unique(carids);
    
%% Find the indexes of every id and put all index vectors into cell arrays
    % successful

    % Total amount of car ids 
    howmanyids = length(uniquecarids);
    
    for i = 1:howmanyids
        indexcell{i} = find(carids==uniquecarids(i));
    end
    
%% Find the collections of every vehicle's timestamps
    for i = 1:howmanyids
        timestampsof{i} = timestamps(indexcell{i});
    end
    
%% Find the range of each id's timestamps
    for i = 1:howmanyids
        difference(i) = range(timestampsof{i});
    end
%% Reshape range and uniquecarids into the required format
    
    outarr(:,1) = uniquecarids';
    outarr(:,2) = round(difference',1);
end