function out_vec = order_base_elements(in_vec)
% in_vec = 1xn cell array containing heat, cold, electricity, toxin
% out_vec = ordered in the order of heat, cold, electricity, toxin
l = numel(in_vec);
ind_vec = nan(1,l);
for i = 1:l
  ind_vec(i) = base_element_to_index(lower(in_vec{i}));
end
[~,sort_order] = sort(ind_vec);
out_vec = in_vec(sort_order);

end

function num = base_element_to_index (str)
switch str
  case 'heat'
    num = 0;
  case 'cold'
    num = 1;
  case 'electricity'
    num = 2;
  case 'toxin'
    num = 3;
  otherwise
    num = 4;
end
end