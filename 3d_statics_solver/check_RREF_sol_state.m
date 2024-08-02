function sol_state = check_RREF_sol_state(mat)

h = size(mat,1); % number of rows
zero_row_count = 0; 
for i = h:-1:1
  if all(mat(i,:)==0)
    zero_row_count = zero_row_count+1;
  else
    break
  end
end
if zero_row_count > 0
  mat(end:-1:(end-zero_row_count+1),:) = [];
end

if isempty(mat)
  sol_state = 2; return;
end

if mat(end,end) ~=0 && mat(end,end-1) == 0
  sol_state = 0; return; 
else
  r = rank(mat);
  w = size(mat,2);
  if r == w-1
    sol_state = 1;
  else
    sol_state = 2;
  end
end

end