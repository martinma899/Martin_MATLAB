function [out] = determinant (arr)
    if length(arr)<3
        out = arr(1).*arr(4)-arr(2).*arr(3);
    else
        [matrices,cofactors,signs,size] = nastycalc(arr);
        for i = 1:size
            temp{i} = signs(i).*cofactors(i).*determinant(matrices{i});
        end
        out = sum(cell2mat(temp));
    end

end

function [matrices,cofactors,signs,long] = nastycalc(arr)

    long = size(arr);
    cofactors = arr(:,1)';
    
    cutofffirstcol = arr(:,2:end);
    
    for i = 1:long
        temp = cutofffirstcol;
        temp(i,:) = [];
        matrices{i} = temp;
    end
    
    signs = -((-1).^(1:5));
    
end