function [foundonesdata,proffoundcell] = eng1102prof(xlsname)

%% Read data
    [num,txt,raw] = xlsread(['110' num2str(xlsname) 'data.xlsx']);
    [a,b] = size(raw);
    [~,~,profnames] = xlsread('prof names.xlsx');
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
            [firstx,lastlx] = strtok(lower(raw{c,1}),' ');
            firstx(end) = [];
            lastlx = lastlx(2);
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
            proffoundcell{i,2} = ['not found in 110' num2str(xlsname) ' data'];
        end
        bool = false;
    end
    
    [~,index] = sort(cell2mat(foundonesdata(:,3)),'descend');
    
    foundonesdata = foundonesdata(index,:);
    
end