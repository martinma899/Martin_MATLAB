function [wpb] = read_weapon_xlsx(filename)
% filename is weapon_name.xlsx
[~,~,data] = xlsread(filename);
for i = 1:size(data,1)
  wpb.(data{i,1}) = data{i,2};
end

end