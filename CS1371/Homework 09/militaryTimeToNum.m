function [num] = militaryTimeToNum (str)

    [front,back] = strtok(str,':');
    back = back(2:end);
    minutes1 = str2double(front)*60;
    minutes2 = str2double(back);
    num = minutes1+minutes2;

end