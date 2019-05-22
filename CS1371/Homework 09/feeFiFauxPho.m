function [logic,cell] = feeFiFauxPho (txt,excel)
%% Get data from the txt file
    
    lines = linecount(txt)-1; % Count total number of lines
    fid = fopen(txt,'r'); % Open file
    fgetl(fid); % Skip first line
    % Extract files line by line
    for i = 1:lines
        [num(i),unit{i},ingredient{i}] = processtxtdata (fgetl(fid));
    end
    % Transpose all of the row cell arrays
    num = num';
    unit = unit';
    ingredient = ingredient';

%% Get data from excel file
    
    [~,~,data] = xlsread(excel); % read data
    
    [row,col] = size(data);
    
    for i = 1:col
        temp = data{1,i};
        switch temp
            case 'Amount'
                amountid = i;
            case 'Unit'
                unitid = i;
            case 'Ingredient'
                ingredientid = i;
        end
    end
    
    shopnum = cell2mat(data(2:end,amountid)); % Put numbers in a vector
    shopunit = data(2:end,unitid); % Put units in cell array
    shopingredient = data(2:end,ingredientid); % put ingredients in cell array
    
%% Determine if there's enough types of ingredients
    
    for i = 1:lines
        ingredienttypeboolvec(i) = ismember(ingredient{i},shopingredient);
    end
    
    ingredienttypebool = all(ingredienttypeboolvec);
    
%% Two situations: all ingredients present or all ingredients not present

    if ingredienttypebool % if all ingredients are present
        % Check if all ingredients are enough
        for i = 1:row-1
            % Index from the recipe of the shoplist
            if ismember(shopingredient{i},ingredient)
            whichoneinrecipe = cellvecfind(ingredient,shopingredient{i});
            remain(i) = shopnum(i)-num(whichoneinrecipe);
            else
            remain(i) = shopnum(i);
            end
        end
        isenough = all(remain>=0); % Whether we have enough ingredients or not
        
        if isenough % If all ingredients are enough
            logic = true;
            % mesh everything and output an array
            cell = formatdata (remain,shopunit,shopingredient);
        else
            logic = false;
            cell = formatdata (shopnum,shopunit,shopingredient);
        end
    else
        logic = false;
        cell = formatdata (shopnum,shopunit,shopingredient);
    end
end

function [cell] = formatdata (shopnum,shopunit,shopingredient)

    % create an empty cell
    long = length(shopnum);
    cell = num2cell(zeros(long+1,3));
    
    cell{1,1} = 'Amount';
    cell{1,2} = 'Unit';
    cell{1,3} = 'Ingredient';
    
    for i = 1:long
        cell{i+1,1} = shopnum(i);
        cell{i+1,2} = shopunit{i};
        cell{i+1,3} = shopingredient{i};
    end
    
end

function [index] = cellvecfind (cell,element)
    [a,b] = size(cell);
    logic = logical(zeros(a,b));
    long = a*b;
    for i = 1:long
        logic(i) = isequal(cell{i},element);
    end
    index = find(logic);
end

function [num,unit,ingredient] = processtxtdata (str)

    [num,remain]= strtok(str,' ');
    num = str2double(num);
    
    [unit,ingredient] = strtok(remain,' ');
    
    ingredient = ingredient(2:end);

end

function n = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end