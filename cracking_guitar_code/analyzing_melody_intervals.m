clear

scale_diff = [2 2 1 2 2 2 1];
random_scale_num = generate_scale (scale_diff,note2number('C3'),15);
random_scale_str = number2note_arr(random_scale_num)';

melody_sentence_arr = {[5 10 9 5 7],[3 8 7 3 1],[2 3 4 5 8 7],[2 5 2 3]};

intervals = [];

for i = 1:numel(melody_sentence_arr)
  sentence = random_scale_num(melody_sentence_arr{i});
  intervals = [intervals diff(sentence)];
end

intervals_lib = -12:12;
intervals_lib_str = num2interval_arr(intervals_lib);
intervals_str = num2interval_arr(intervals);

for i = 1:numel(intervals_lib)
  this_interval_str = intervals_lib_str{i};
  count = sum(intervals == intervals_lib(i));
  fprintf('%3d %22s %3d\n',i,this_interval_str,count)
end