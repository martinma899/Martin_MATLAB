function [outarr,rawsortedindex] = sortbasedontwocols (inarr)
    [a,~] = size(inarr);
    [~,rawsortedindex] = sort(inarr(:,1),'descend');
    rawsorted = inarr(rawsortedindex,:);
    rawsortedcopy = rawsorted;
    rawsortedindexcopy = rawsortedindex;
    outarr = [];
    c = 1;
    while c <= a
        % The attack value about which we wanna find its repetition
        interestedvalue = rawsortedcopy(1,1); 
        interestedindex = rawsortedindexcopy(1);
        % Logical vector indicating whether it repeates or not
        logic = rawsortedcopy(:,1) == interestedvalue;
        % Find how many time it repeats
        long = length(find(logic));
        % Put repeating rows in an arr
        temparr = rawsortedcopy(logic,:);
        % Find sorted index based on second column
        [~,secondarysortindex] = sort(temparr(:,2));
        % Sort temparr in general
        temparr = temparr(secondarysortindex,:);
        % concatenate temparr to outarr
        outarr = [outarr;temparr];
        
        rawsortedindex(c:c+long-1) = secondarysortindex(end:-1:1)+c;
        
        rawsortedcopy(1:long,:) = []; % delete things for next loop
        rawsortedindexcopy(1:long) = [];
        c = c+long;
    end
    
end