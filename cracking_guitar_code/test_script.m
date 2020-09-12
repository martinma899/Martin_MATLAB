clear

scale_diff = [2 2 1 2 2 2 1];
random_scale_num = generate_scale (scale_diff,note2number('C3'),23);
random_scale_str = number2note_arr(random_scale_num)'

interval_lib = [];
% positive intervals
for i = 8:(8+6)
  for j = (i+1):(i+6)
    interval_n = random_scale_num(j)-random_scale_num(i);
    interval_lib = [interval_lib; interval_n];
    
    interval = num2interval(interval_n);
    fprintf('%7s -> %7s %2d -> %2d  %22s  %d\n',random_scale_str{i},random_scale_str{j},mod(i-1,7)+1,mod(j-1,7)+1,interval,interval_n);
  end
  fprintf('\n')
end
% negative intervals
for i = 15:(15+6)
  for j = (i-1):-1:(i-6)
    interval_n = random_scale_num(j)-random_scale_num(i);
    interval_lib = [interval_lib; interval_n];
    
    interval = num2interval(interval_n);
    fprintf('%7s -> %7s %2d -> %2d  %22s  %d\n',random_scale_str{i},random_scale_str{j},mod(i-1,7)+1,mod(j-1,7)+1,interval,interval_n);
  end
  fprintf('\n')
end

[GC,GR] = groupcounts(interval_lib);
for i = 1:numel(GR)
  fprintf('%3d %22s %3d\n',GR(i),num2interval(GR(i)),GC(i))
end