function str_out = remove_comment(str_in)
first_delim_ind = nan;
n = numel(str_in);
for i = 1:n
  if str_in(i) == '%'
    first_delim_ind = i; 
    break;
  end
end

if isnan(first_delim_ind)
  str_out = str_in;
elseif first_delim_ind == 1
  str_out = '';
else
  str_in(first_delim_ind:end) = [];
  str_out = str_in; 
end

end