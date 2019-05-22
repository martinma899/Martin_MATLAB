function [raw,numdata] = getourdata (data,teamid)

    % raw is everything
    % numdata is nX3 matrix, representing our score, opponent score, margin
    
    % check every row, look for team id
    
    s = size(data);
    
    raw = [];
    numdata = [];
    
    for i = 1:s(1)
        temprow = data(i,:);
        for j = 1:s(2)
            if strcmp(temprow{j},teamid)
                raw = [raw;temprow];
                if j==1||j==2||j==3
                    numdata = [numdata;[temprow{7} temprow{8} temprow{7}-temprow{8}]];
                elseif j==4||j==5||j==6
                    numdata = [numdata;[temprow{8} temprow{7} temprow{8}-temprow{7}]];
                end
                break;
            end
        end
    end
    
end