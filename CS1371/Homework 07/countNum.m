function [count] = countNum (array,num)

    [a,b] = size(array);
    sizee = a*b;
    count=0;
    for i = 1:sizee
        if array(i)==num
            count = count+1;
        end
    end

end