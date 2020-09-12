function scale = generate_scale (diff_arr,start_note,num_notes)
% generate a scale that is an array of numbers
% C1 = 0
% diff_arr is the difference of semitones between each notes
% for example 2 2 1 2 2 2 1 is major (ionian) scale
% 2 2 3 2 3 is pentatonic scale
% diff_arr must sum to 12
% start_note is a number that designates the starting note
% num_notes designates the number of notes to be included in scale

if sum(diff_arr)~=12
  error('sum of difference vector does not equal 12')
end

num_notes_ceil = ceil(num_notes/numel(diff_arr));
extended_diff_arr = [];
for i = 1:num_notes_ceil
  extended_diff_arr = [extended_diff_arr diff_arr];
end
extended_diff_arr = extended_diff_arr(1:num_notes-1);

scale = cumsum([start_note extended_diff_arr]);


end