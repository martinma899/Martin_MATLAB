function [note_arr] = number2note_arr (num_arr)
note_arr = cell(1,numel(num_arr));
for i = 1:numel(num_arr)
  note_arr{i} = number2note(num_arr(i));
end
end