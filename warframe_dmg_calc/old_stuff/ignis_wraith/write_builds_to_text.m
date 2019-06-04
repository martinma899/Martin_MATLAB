fid = fopen(filename,'w+');

% write mods
fieldnames = fields(mods(1));

% mandatory mods
fprintf(fid,'--> Mandatory Mods <--\n\n');
for i = mandatory_mods_arr
  thismod = mods(i);
  fprintf(fid,'%2d  %20s',i,thismod.name);
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
  fprintf(fid,'%2d  %20s',i,thismod.name);
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
  fprintf(fid,'%2d  %20s',i,thismod.name);
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

% write builds

i = 0;
while true
  i = i+1;
  switch sort_criteria
    case 'average'
      dps_pct = wp_arr(i).avg_dps/dps_max;
    case 'burst'
      dps_pct = wp_arr(i).burst_dps/dps_max;
  end
  if dps_pct<dmg_threshold
    break;
  end
  fprintf(fid,'--> Build Ranking #%d <--\n\n',i);
  temp = mod_name_arr(wp_arr(i).build);
  fprintf(fid,'    %20s\n',temp{:});
  fprintf(fid,'\nAverage DPS: %10.2f\n',wp_arr(i).avg_dps);
  fprintf(fid,'  Burst DPS: %10.2f\n',wp_arr(i).burst_dps);
  fprintf(fid,'avg DPS as percent of top build: %5.2f%%\n\n',dps_pct*100);
end

fclose(fid);