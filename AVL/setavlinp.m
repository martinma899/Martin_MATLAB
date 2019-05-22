function setavlinp (avlinpfilename,casefilename)
  fid = fopen(avlinpfilename,'r');
  array = [];
  while true
    line = fgetl(fid);
    if ~ischar(line)
      break;
    end
    array = [array;{line}];
  end
  array{2} = casefilename;
  fclose(fid);
  fid = fopen(avlinpfilename,'w');
  for i = 1:numel(array)
    fprintf(fid,'%s\n',array{i});
  end
  fclose(fid);
end