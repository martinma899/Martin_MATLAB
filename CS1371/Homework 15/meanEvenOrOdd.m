function [avg] = meanEvenOrOdd (vec,str)

    switch lower(str)
        case 'odd'
            vec(mod(vec,2)==0) = [];
        case 'even'
            vec(mod(vec,2)==1) = [];
    end
    avg = mean(vec);

end