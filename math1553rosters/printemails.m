clc;clear
[~,~,data] = xlsread('1553 J2.xlsx');
emails = data(2:end,4);

for i = 1:numel(emails)
  email = [emails{i} '@gatech.edu'];
  if ~strcmp(email,'zma70@gatech.edu')
  fprintf('%s\n',email);
  end
end

[~,~,data] = xlsread('1553 L2.xlsx');
emails = data(2:end,4);

for i = 1:numel(emails)
  email = [emails{i} '@gatech.edu'];
  if ~strcmp(email,'zma70@gatech.edu')
  fprintf('%s\n',email);
  end
end