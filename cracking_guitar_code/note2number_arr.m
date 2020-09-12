function [num_arr] = note2number_arr (note_arr)
num_arr = zeros(1,numel(note_arr));
for i = 1:numel(note_arr)
  num_arr(i) = note2number(note_arr{i});
end
end