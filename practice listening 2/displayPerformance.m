function [] = displayPerformance(fnameArr,performanceArr)
disp(' ');
  for i = 1:length(fnameArr)
    if performanceArr(i,2)==0
      str = sprintf('0%%');
    else
      str = sprintf('%2.2f%%', 100*performanceArr(i,1)/performanceArr(i,2));
    end
    if length(str)<7
      str = [str char(32*ones(1,7-length(str)))];
    end
    fprintf('%s %d/%d %s\n',str,performanceArr(i,1),performanceArr(i,2)...
      ,fnameArr{i});
  end
end