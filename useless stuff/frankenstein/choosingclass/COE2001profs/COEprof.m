function [foundonesdata,proffoundcell] = COEprof()

%% Read data
    [num,txt,raw] = xlsread('COE2001data.xlsx');
    [a,b] = size(raw);
    [~,~,profnames] = xlsread('COE2001profnames.xlsx');
    
%% The formatting of the document has some issues. Fix those issues.

    % Add missing spaces
    for i = 1:a-1
        name1 = raw{i,1};
        name2 = raw{i+1,1};
        commaindex1 = strfind(name1,',');
        commaindex2 = strfind(name2,',');
        if name1(commaindex1+1)~=' '
            [initial,second] = strtok(name1,',');
            second = [', ' second(2:end)];
            raw{i,1} = [initial second];
        end
        if name2(commaindex2+1)~=' '
            [initial,second] = strtok(name2,',');
            second = [', ' second(2:end)];
            raw{i+1,1} = [initial second];
        end
    end
    
    count = 1;
    while count<=a
        logicname = strcmp(raw(:,1),raw{count,1});
        indexes = find(logicname);
        count = count+length(indexes);
        if sum(logicname) ~= 1
            [~,greatest] = max(cell2mat(raw(logicname,3)));
            logicname(indexes(greatest)) = false;
            raw(logicname,:) = cell(1,b);
        end
    end
    
    for i = 1:a
        logiccol(i) = isempty(raw{i,1});
    end
    
    logiccol = logiccol';
    new = raw(~logiccol,:);
    raw = new;
    [a,b] = size(raw);
%% For every professor, find if he/she is in file. 
% For the ones on file, extract their data and sort them.
    [howmanyprofs,~] = size(profnames);
    proffoundcell = cell(howmanyprofs,2);
    foundonesdata = {};   
    findex = 1;
    bool = false;
    for i = 1:howmanyprofs
        [first,lastl] = strtok(lower(profnames{i}),' ');
        lastl = lastl(2);
        first(end) = [];
        
        proffoundcell{i,1} = profnames{i};
        
        for c = 1:a
            [firstx,lastlx] = strtok(lower(raw{c,1}),',');
            lastlx = lastlx(3);
            if strcmp(first,firstx)&&strcmp(lastl,lastlx)
                foundonesdata{findex,1} = raw{c,1};
                foundonesdata(findex,2:8) = raw(c,2:8);
                findex = findex+1;
                bool = true;
                thisoneindex = c;
                break
            end    
        end
        if bool
            proffoundcell{i,2} = thisoneindex;
        else
            proffoundcell{i,2} = 'not found in data';
        end
        bool = false;
    end
    
    [~,index] = sort(cell2mat(foundonesdata(:,3)),'descend');
    
    foundonesdata = foundonesdata(index,:);
    
end