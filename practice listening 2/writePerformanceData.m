function [] = writePerformanceData(fname,performanceArr)
  fid = fopen(fname,'w');
  for i = 1:length(performanceArr)
    fprintf(fid,'%d/%d\n',performanceArr(i,1),performanceArr(i,2));
  end
  fclose(fid);
end