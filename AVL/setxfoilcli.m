function setxfoilcli (cli,inputfilename)
  fid = fopen(inputfilename,'r');
  array = [];
  while true
    line = fgetl(fid);
    if ~ischar(line)
      break;
    end
    array = [array;{line}];
  end
  array{8} = num2str(cli);
  fclose(fid);
  fid = fopen(inputfilename,'w');
  for i = 1:numel(array)
    fprintf(fid,'%s\n',array{i});
  end
  fclose(fid);
end