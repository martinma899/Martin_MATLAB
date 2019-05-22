function [logic] = fountainOfYouth(chararr)

    if length(chararr)==5||length(chararr)==4||length(chararr)==3
        if isthereaway(chararr)
            logiclong = chararr=='X';
            logic = any(logiclong(1:end));
        else
            logic = false;
        end
    elseif length(chararr) == 2
            logiclong = chararr=='X';
            logic = any(logiclong(1:end));
    else
        if isthereaway(chararr)
            innerarr = chararr(3:end-2,3:end-2);
            logic = fountainOfYouth(innerarr);
        else
            logic = false;
        end
    end

end

function [logic] = isthereaway(arr)

        outer = arr;
        %[a,b] = size(chararr);
        outer(2:end-1,2:end-1) = 'T';
        logic = outer==' ';
        logic = any(logic(1:end));

end