DirInfo = dir('**.xlsx');
xlsnames = {DirInfo.name}';
xlsnames = xlsnames([4 5 1 6 2 3]);
% 3026 - 2908 - 3129 - 2899 - 3042 - 3032
for i = 1:length(xlsnames)
    [~,~,tempdata] = xlsread(xlsnames{i});
    
    tempdata = tempdata(2:end,9:16);
    
    s = size(tempdata);
    
    for j = 1:s(1)
        for k = 1:s(2)
            tempcontent = tempdata{j,k};
            
            if k==3||k==6
                if isnan(tempcontent)
                    tempdata{j,k} = ' ';
                end
            end
            if any(ismember([1 2 3 4 5 6],k))
                tempdata{j,k} = num2str(tempdata{j,k});
            end
        end
    end
    
    data(i).general = tempdata;
end

% access format: data(i).general
% done reading the file
% think about how to get info

A = [];
B = [];
C = [];

for i = 1:6
    [~,numdata] = getourdata (data(i).general,'3921A');
    A = [A;numdata(:,1)];
    [~,numdata] = getourdata (data(i).general,'3921B');
    B = [B;numdata(:,1)];
    [~,numdata] = getourdata (data(i).general,'3921C');
    C = [C;numdata(:,1)];
end

hold on
%plot(A,'r')
%plot(B,'b')
plot(C,'g')
plot(zeros(1,70),'k')
hold off















