function str_out = remove_end_space (str_in)
n = numel(str_in);
if n == 0
  str_out = '';
  return; 
end
front_spaces = 0; 
for i = 1:n
  if str_in(i)==' '
    front_spaces = front_spaces+1;
  else
    break; 
  end
end
if front_spaces>0
  str_in(1:front_spaces) = [];
end

if isempty(str_in)
  str_out = str_in; 
  return
end

n = numel(str_in);
end_spaces = 0; 
for i = n:-1:1
  if str_in(i)==' '
    end_spaces = end_spaces+1;
  else
    break; 
  end
end

if end_spaces>0
  str_in((end-(end_spaces-1)):end) = [];
end

str_out = str_in; 

end