function [arrout] = recaddone (arrin)

    if length(arrin) == 1
        arrout = arrin+1;
    else
        arrout = [arrin(1)+1 recaddone(arrin(2:end))];
    end

end