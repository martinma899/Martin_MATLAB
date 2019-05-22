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