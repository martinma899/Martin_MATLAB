function cdv = readcdv (outfilename)
fid = fopen(outfilename,'r');
array = [];
while true
  line = fgetl(fid);
  if ~ischar(line)
    break;
  end
  array = [array;{line}];
end
for i = 1:numel(array)
  datastr = array{end-i};
  if numel(datastr>=10)
    if strcmp(datastr(1:10),'      Cm =')
      break;
    end
  end
end
cdv = str2double(datastr(29:38));
end