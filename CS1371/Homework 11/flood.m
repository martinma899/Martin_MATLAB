function [count] = flood (vec)
    if all(vec==0)
        count = 0;
    else
        vec = rectakeoutendzeros(vec);
        vecfilled = vec;
        vecfilled(vecfilled==0) = 1; 
        count = length(find(vec==0))+flood(vecfilled-1);
    end
end
function [out] = rectakeoutendzeros (in)
    if in(1)~=0&&in(end)~=0
        out = in;
    elseif in(1)==0&&in(end)~=0
        out = rectakeoutendzeros(in(2:end));
    elseif in(1)~=0&&in(end)==0
        out = rectakeoutendzeros(in(1:end-1));
    elseif in(1)==0&&in(end)==0
        out = rectakeoutendzeros(in(2:end-1));
    end 
end