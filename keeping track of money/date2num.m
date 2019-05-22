function [datenumarr] = date2num (datestrarr)

    datenumarr = [];
    for i = 1:length(datestrarr)
        currentdate = datestrarr{i};
        [month,rest] = strtok(currentdate,'/');
        month = str2double(month);
        [date,~] = strtok(rest,'/');
        date = str2double(date);
        switch month
            case 8
                datenumber = date-19;
            case 9
                datenumber = date+12;
            case 10
                datenumber = date+44;
            case 11
                datenumber = date+75;
            case 12
                datenumber = date+105;
        end
        datenumarr = [datenumarr datenumber];
    end

end