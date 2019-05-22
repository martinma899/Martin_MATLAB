function [classmatrix] = str2schedule(str,weektime)

    str(isletter(str)) = [];
    str(str==' ') = [];
    [front,behind] = strtok(str,'-');
    behind = behind(2:end);
    
    [starthour,startmin] = strtok(front,':');
    startmin = startmin(2:end);
    starthour = str2double(starthour);
    if starthour<8
        starthour = starthour+12;
    end
    starthour = starthour*60;
    startmin = str2double(startmin);
    starttime = starthour+startmin-5;
    

    [endhour,endmin] = strtok(behind,':');
    endmin = endmin(2:end);
    endhour = str2double(endhour);
    if endhour<8
        endhour = endhour+12;
    end
    endhour = endhour*60;
    endmin = str2double(endmin);
    endtime = endhour+endmin+5;
    
    classperiodindex = ((starttime:30:endtime)-450)/30;
    classperiodindex = classperiodindex';
    classperiodindex = classperiodindex(1:end-1);
    
    classmatrix = zeros(18,5);
    
    switch weektime
        case 'MWF'
            classmatrix(classperiodindex,[1 3 5]) = 1;
        case 'TR'
            classmatrix(classperiodindex,[2 4]) = 1;
        case 'MW'
            classmatrix(classperiodindex,[1 3]) = 1;
    end
    
end