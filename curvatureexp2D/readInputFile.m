function [arrout] = readInputFile(fname)
  fid = fopen(fname,'r');
  arrout = [];
  while true
    line = fgetl(fid);
    if ~ischar(line)
      break
    end
    [x,y] = strtok(line,' ');
    x = str2double(x);
    y = str2double(y);
    arrout = [arrout;x,y];
  end
end