% write mods
fieldnames = fields(mods(1));

% mandatory mods
fprintf(fid,'--> Mandatory Mods <--\n\n');
if isempty(mandatory_mods_ind)
  fprintf(fid,'  no mandatory mods specified\n');
else
  for i = mandatory_mods_ind
    thismod = mods(i);
    fprintf(fid,'%2d  %22s',i,thismod.name);
    for j = 2:numel(fieldnames)
      multiplierValue = thismod.(fieldnames{j});
      if multiplierValue~=0
        fprintf(fid,' %4s ',fieldnames{j});
        if multiplierValue>0
          fprintf(fid,' +%3.2f ',multiplierValue);
        else
          fprintf(fid,' %4.2f ',multiplierValue);
        end
      end
    end
    fprintf(fid,'\n');
  end
end
fprintf(fid,'\n');

% flexible mods
fprintf(fid,'--> Flexible Mods <--\n\n');
if isempty(flexible_mods_ind)
  fprintf(fid,'  no flexible mods specified\n');
else
  for i = flexible_mods_ind
    thismod = mods(i);
    fprintf(fid,'%2d  %22s',i,thismod.name);
    for j = 2:numel(fieldnames)
      multiplierValue = thismod.(fieldnames{j});
      if multiplierValue~=0
        fprintf(fid,' %4s ',fieldnames{j});
        if multiplierValue>0
          fprintf(fid,' +%3.2f ',multiplierValue);
        else
          fprintf(fid,' %4.2f ',multiplierValue);
        end
      end
    end
    fprintf(fid,'\n');
  end
end
fprintf(fid,'\n');

% excluded mods
fprintf(fid,'--> Excluded Mods <--\n\n');
if isempty(excluded_mods_ind)
  fprintf(fid,'  no excluded mods specified\n');
else
  for i = excluded_mods_ind
    thismod = mods(i);
    fprintf(fid,'%2d  %22s',i,thismod.name);
    for j = 2:numel(fieldnames)
      multiplierValue = thismod.(fieldnames{j});
      if multiplierValue~=0
        fprintf(fid,' %4s ',fieldnames{j});
        if multiplierValue>0
          fprintf(fid,' +%3.2f ',multiplierValue);
        else
          fprintf(fid,' %4.2f ',multiplierValue);
        end
      end
    end
    fprintf(fid,'\n');
  end
end
fprintf(fid,'\n');

% comments
fprintf(fid,'--> Comments <--\n\n');
if ~isempty(comments)
  for i = 1:numel(comments)
    fprintf(fid,'%s\n',comments{i});
  end
end
fprintf(fid,'\n');