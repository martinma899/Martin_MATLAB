function [out] = lookupclass ()

    [~,~,data] = xlsread('class3.xlsx');
    data = data(3:end,1:20);
    [long,~] = size(data);

    isavailable = [];

    for a = 1:long
        isavailable = [isavailable isnan(data{a,1})];
    end
    isavailable = logical(isavailable);

    opendata = data(isavailable,:);
    [long2,~] = size(opendata);
    
    isavailable2 = [];
    for b = 1:long2
        isavailable2 = [isavailable2 isclassopen(opendata,b)];
    end
    isavailable2 = logical(isavailable2);
    
    opendata2 = opendata(isavailable2,:);
    [long3,~] = size(opendata2);
    
    isavailable3 = [];
    for i = 1:long3
        isavailable3 = [isavailable3 istimepermitted(opendata2,i)];
    end
    
    isavailable3 = logical(isavailable3);
    opendata3 = opendata2(isavailable3,:);
    
    out = opendata3(:,[2 5 10 11 12 13 14 17 18 19]);
    
    sortingarr = [cell2mat(out(:,8)) cell2mat(out(:,7))];
    
    [~,index] = sortbasedontwocols (sortingarr);
    
    out = out(index,:);
end

function [logic] = isclassopen (data,linee)

    remain = data{linee,14};
    waitlistremain = data{linee,17};
    
    if remain == 0
        if waitlistremain <= 0
            logic = false;
        else
            logic = true;
        end
    else
        logic = true;
    end
    
end

function [outarr,index] = sortbasedontwocols (inarr)
    
    [a,b] = size(inarr);
    
    outarr = zeros(a,b);
    
    for i = 1:a
        temp(i) = inarr(i,1)+inarr(i,2)/1000;
    end
    
    [~,index] = sort(temp,'descend');
    
    outarr(1:a,1) = inarr(index,1);
    outarr(1:a,2) = inarr(index,2);
    
    index = index';
end

function [logic] = istimepermitted (data,line)

    weektime = data{line,10};
    daytime = data{line,11};
    
    schedule = [1 1 1 0 0;
                1 1 1 0 0;
                1 1 1 0 1;
                1 1 1 0 1;
                0 1 0 0 0;
                0 1 0 0 0;
                0 0 0 0 0;
                0 0 0 0 0;
                1 0 1 0 0;
                1 0 1 0 0;
                1 0 1 0 0;
                1 1 1 1 0;
                0 1 0 1 0;
                0 1 0 1 0;
                1 0 1 1 0;
                1 0 1 1 0;
                1 0 1 1 0;
                0 0 0 1 0;
                0 0 0 0 0;
                0 0 0 0 0;
                0 0 0 0 0];
    schedule = logical(schedule);
    
    classmatrix = str2schedule(daytime,weektime);
    combined = schedule+classmatrix;
    maximum = max(max(combined));
    
    logic = ~isequal(maximum,2);

end

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
    
    classmatrix = zeros(21,5);
    
    switch weektime
        case 'MWF'
            classmatrix(classperiodindex,[1 3 5]) = 1;
        case 'TR'
            classmatrix(classperiodindex,[2 4]) = 1;
        case 'MW'
            classmatrix(classperiodindex,[1 3]) = 1;
    end
    
end