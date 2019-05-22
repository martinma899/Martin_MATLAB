function [outarr,index] = sortbasedontwocols2 (inarr)
    
    [a,b] = size(inarr);
    
    outarr = zeros(a,b);
    
    for i = 1:a
        temp(i) = inarr(i,1)-inarr(i,2)/100000;
    end
    
    [~,index] = sort(temp,'descend');
    
    outarr(1:a,1) = inarr(index,1);
    outarr(1:a,2) = inarr(index,2);
    
    index = index';
end