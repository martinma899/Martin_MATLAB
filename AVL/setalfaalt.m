function setalfaalt(alfa,filename)
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
array{21} = num2str([0 -5 2 1.0 -alfa 0 0]);
array{28} = num2str([0 -5 0.3 1.0 -alfa 0 0]);
array{56} = num2str([0 5 0.3 1.0 -alfa 0 0]);
array{63} = num2str([0 5 2 1.0 -alfa 0 0]);

fclose(fid);
fid = fopen(filename,'w');
for i = 1:numel(array)
  fprintf(fid,'%s\n',array{i});
end
fclose(fid);
end