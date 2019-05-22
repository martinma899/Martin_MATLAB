function [num] = testingcountingy (in)

    heylower = length(strfind(in,'Hey'));
    heyupper = length(strfind(in,'HEY'));
    
    if logical(heylower)
        y = strfind(in,'Heyy')+4;
        hey = 2;
        while y<=length(in)&&in(y)=='y'
            hey = hey+2;
            y = y+1;
        end
    elseif logical(heyupper)
        y = strfind(in,'HEYY')+4;
        hey = 2;
        while y<=length(in)&&in(y)=='Y'
            hey = hey+2;
            y = y+1;
        end
    else
        hey = 0;
    end
    
    num = hey;

end