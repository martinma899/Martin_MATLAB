function out_vec = combine_elements (in_vec)
% in_vec = 1xn cell array with element names
l = numel(in_vec);
ind_vec = nan(1,l);
for i = 1:l
  ind_vec(i) = element_to_index(lower(in_vec{i}));
end
ind_vec = unique(ind_vec,'stable');
ind_vec(ind_vec==10) = [];
combined_element_mask = ind_vec>=4;

combined_element_ind_vec = ind_vec(combined_element_mask);
base_element_ind_vec = ind_vec(~combined_element_mask);


while true
  if isempty(base_element_ind_vec)
    break;
  elseif numel(base_element_ind_vec) == 1
    combined_element_ind_vec = [combined_element_ind_vec base_element_ind_vec];
    break;
  else
    combined_element_ind_vec = [combined_element_ind_vec combine_two_element_ind(base_element_ind_vec(1),base_element_ind_vec(2))];
    base_element_ind_vec([1 2]) = [];
  end
end

combined_element_ind_vec = unique(combined_element_ind_vec);
combined_element_ind_vec = sort(combined_element_ind_vec,'descend');

l2 = numel(combined_element_ind_vec);

out_vec = cell(1,l2);
for i = 1:l2
  out_vec{i} = index_to_element(combined_element_ind_vec(i));
end


end

% function type = element_type (str)
% switch str
%   case {'heat' 'cold' 'electricity' 'toxin'}
%     type = 0;
%   case {'radiation' 'magnetic' 'gas' 'viral' 'corrosive' 'blast'}
%     type = 1;
%   otherwise 
%     type = 2;
% end
% end

function num = element_to_index (str)
switch str
  case 'heat'
    num = 0;
  case 'cold'
    num = 1;
  case 'electricity'
    num = 2;
  case 'toxin'
    num = 3;
  case 'radiation'
    num = 4;
  case 'magnetic'
    num = 5;
  case 'gas'
    num = 6;
  case 'viral'
    num = 7;
  case 'corrosive'
    num = 8;
  case 'blast'
    num = 9;
  otherwise
    num = 10;
end
end

function str = index_to_element (num)
switch num
  case 0
    str = 'heat';
  case 1
    str = 'cold';
  case 2
    str = 'electricity';
  case 3
    str = 'toxin';
  case 4
    str = 'radiation';
  case 5
    str = 'magnetic';
  case 6
    str = 'gas';
  case 7
    str = 'viral';
  case 8
    str = 'corrosive';
  case 9
    str = 'blast';
  otherwise
    str = '-';
end
end

function num = combine_two_element_ind(ind1,ind2)
if ind1 > ind2
  tmp = ind2;
  ind2 = ind1;
  ind1 = tmp;
end
if ind1 == 0 && ind2 == 1
  num = 9;
elseif ind1 == 0 && ind2 == 2
  num = 4;
elseif ind1 == 0 && ind2 == 3
  num = 6;
elseif ind1 == 1 && ind2 == 2
  num = 5;
elseif ind1 == 1 && ind2 == 3
  num = 7;
elseif ind1 == 2 && ind2 == 3
  num = 8;
end
end
