function [vec] = testingCollatz (num)

    vec(1) = num;
    n = 2;

    if ~logical(mod(num,2))
        thing = num/2;
    else
        thing = (num*3+1)/2;
    end

    while thing > 1
        vec(n) = thing;
        disp(vec(n));
        if ~logical(mod(vec(n),2))
            thing = vec(n)/2;
        else
            thing = (vec(n)*3+1)/2;
        end
        n = n+1;
    end

end