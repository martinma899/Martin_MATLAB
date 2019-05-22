function setalfa(alfa,filename)
  fid = fopen(filename,'r');
  array = [];
  while true
    line = fgetl(fid);
    if ~ischar(line)
      break;
    end
    array = [array;{line}];
  end
  array{17} = num2str(alfa);
  fclose(fid);
  fid = fopen(filename,'w');
  for i = 1:numel(array)
    fprintf(fid,'%s\n',array{i});
  end
  fclose(fid);
end