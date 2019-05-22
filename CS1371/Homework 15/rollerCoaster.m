function [ride] = rollerCoaster(fname,category,blah)

    switch lower(blah)
        case 'most'
            [~,~,data] = xlsread(fname);
            categoryarr = data(1,2:end);
            column = 1+find(strcmp(categoryarr,category));
            [~,row] = max(cell2mat(data(2:end,column)));
            ride = data{row+1,1};
        case 'least'
            [~,~,data] = xlsread(fname);
            categoryarr = data(1,2:end);
            column = 1+find(strcmp(categoryarr,category));
            [~,row] = min(cell2mat(data(2:end,column)));
            ride = data{row+1,1};
        otherwise
            ride = 'Just pick one!';
    end

end