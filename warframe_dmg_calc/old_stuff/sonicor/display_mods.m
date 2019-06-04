%% display all mods in arsenal

fprintf('\n--> Mandatory Mods: <--\n\n')
if ~isempty(mandatory_mods_arr)
  for i = mandatory_mods_arr
    fprintf('%i %s\n',i,mods(i).name)
  end
else
  fprintf('none\n')
end

fprintf('\n--> Flexible Mods: <--\n\n')
if ~isempty(flexible_mods_arr)
  for i = flexible_mods_arr
    fprintf('%i %s\n',i,mods(i).name)
  end
  else
  fprintf('none\n')
end

fprintf('\n--> Excluded Mods: <--\n\n')
if ~isempty(excluded_mods_arr)
  for i = excluded_mods_arr
    fprintf('%i %s\n',i,mods(i).name)
  end
  else
  fprintf('none\n')
end