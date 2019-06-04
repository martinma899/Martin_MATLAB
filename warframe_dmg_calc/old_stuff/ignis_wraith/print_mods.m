% write mods
fieldnames = fields(mods(1));

% mandatory mods
fprintf(fid,'--> Mandatory Mods <--\n\n');
for i = mandatory_mods_arr
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
fprintf(fid,'\n');

% flexible mods
fprintf(fid,'--> Flexible Mods <--\n\n');
for i = flexible_mods_arr
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
fprintf(fid,'\n');

% excluded mods
fprintf(fid,'--> Excluded Mods <--\n\n');
for i = excluded_mods_arr
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
fprintf(fid,'\n');