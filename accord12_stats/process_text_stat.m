clc;clear;close('all')

fid = fopen('K24Z3_stats.txt');

rpm = [];torque = []; hp = [];

while true
  str = fgetl(fid); % get a new line
  if ~ischar(str); break; end % if reach end of line then break
  words = split(str,' '); % split the line using space
  rpmi = str2double(words{1}); % convert rpm
  torquei = str2double(words{6}); % convert torque
  hpi = str2double(words{15}); % convert hp
  rpm = [rpm;rpmi]; % store rpm
  torque = [torque;torquei]; % store torque
  hp = [hp;hpi]; % store hp
end

k24z3 = table(rpm,torque,hp);
save('k24z3.mat','k24z3');
fclose(fid);