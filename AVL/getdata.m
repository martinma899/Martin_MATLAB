function [cl,cdi,cliarr,sarr] = getdata (filename)
  fid = fopen(filename,'r');
  array = [];
  while true
    line = fgetl(fid);
    if ~ischar(line)
      break;
    end
    array = [array;{line}];
  end
  clcdstr = array{16};
  cl = str2double(clcdstr(17:27));
  cdi = str2double(clcdstr(41:end));

  dataarrtxt = array(21:end-1);
  cliarr = zeros(numel(dataarrtxt),1);
  sarr = zeros(numel(dataarrtxt),1);
  for i = 1:numel(dataarrtxt)
    numberstrip = str2num(dataarrtxt{i});
    cliarr(i) = numberstrip(5);
    sarr(i) = numberstrip(4);
  end
end