function [] = fallAprob9 (xlsname)

    [num,txt,raw] = xlsread(xlsname);
    names = txt(2:end,1);
    
    numsize = size(num);
    
    score = [];
    
    for i = 1:numsize(1)
        tempscore = 0;
        if num(i,1) >= 3.5
            tempscore = tempscore+3;
        end
        if num(i,2)>=520&&num(i,2)<=528
            tempscore = tempscore+5;
        elseif num(i,2)>=510&&num(i,2)<=519
            tempscore = tempscore+3;
        else
            tempscore = tempscore+0;
        end
        if num(i,3)>=4
            tempscore = tempscore+3;
        end
        score = [score;tempscore];
    end

    [score,sortindex] = sort(score,'descend');
    names = names(sortindex);
    
    raw = raw([1;sortindex+1]',:);
    
    rightcolumn = ['Scores';num2cell(score)];
    xlswrite([xlsname(1:end-5) '_updated.xlsx'],[raw rightcolumn]);
    
    fid = fopen('acceptedList.txt','wt');
    
    for i = 1:length(score)
        if i<=3
            fprintf(fid,'%s - Accepted\n',names{i});
        else
            fprintf(fid,'%s - Denied\n',names{i});
        end
    end
    
    fclose(fid);
    
end