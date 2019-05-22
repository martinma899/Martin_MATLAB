function array = driveTime2 (excel)

[data,~,~] = xlsread(excel);

rowtime = data(:,1)';

rowcar = data(:,2)';

howmanycar = length(rowcar);

unic = unique(rowcar);

    for i = 1:unic

         for y = 1:length(rowtime)

             a = i;
             
             while a<=length(unic)

             target = unic(a);

             index = strfind(rowcar,target);

             time{a} = rowtime(index);

             a = a+1;

            end

         end
    end

    array = zeros(length(unic),2)

    i = 1

    for i = 1:length(unic)
        ti = min(time{i}) 
        tf = max(time{i}) 
        ct = tf - ti
        array(i,1) = unic(i)
        array(i,2) = ct
        i = i+1
    end
end


 



