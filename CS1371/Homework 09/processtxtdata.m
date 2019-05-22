function [num,unit,ingredient] = processtxtdata (str)

    [num,remain]= strtok(str,' ');
    num = str2double(num);
    
    [unit,ingredient] = strtok(remain,' ');
    
    ingredient = ingredient(2:end);

end