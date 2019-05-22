function [out] = speedStack (long,character)

    vec(1:long) = character;
    vec(2:2:long) = ' ';

    out = calcarr(vec,character);
    
    out = char(out);
    
end

function [out] = calcarr (in,character)

    if length(find(in(1,:)==character))<2
        out = in;
    else
        lastline = in(1,:);
        [~,previousindex] = find(lastline==character);
        lastline(1:end) = ' ';
        stackindex = (min(previousindex)+1):2:(max(previousindex)-1);
        lastline(stackindex) = character;
        out = [calcarr(lastline,character);in];
    end

end