function [inter_arr] = num2interval_arr (num_arr)
inter_arr = cell(1,numel(num_arr));
for i = 1:numel(num_arr)
  inter_arr{i} = num2interval(num_arr(i));
end
end