function [performanceArr] = readPerformanceData(fname)
  fid = fopen(fname,'r');
  performanceArr = [];
  line = fgetl(fid);
  while ischar(line)
    [success,total] = strtok(line,'/');
    success = str2double(success);
    total = str2double(total(2:end));
    performanceArr = [performanceArr; success total];
    line = fgetl(fid);
  end
  fclose(fid);
end