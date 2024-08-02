function process_element_spreadsheet(fname)
% read in spreadsheet
[~,~,data] = xlsread(fname,'Sheet1','A2:E162');
[r,c] = size(data);
output_str_arr = [];

for i = 1:r
innate_ind_1 = base_element_to_index(data{i,4});
innate_ind_2 = base_element_to_index(data{i,5});
if innate_ind_1 > innate_ind_2
  innate_1 = data{i,5};
  innate_2 = data{i,4};
else
  innate_1 = data{i,4};
  innate_2 = data{i,5};
end
element_vec = [data(i,1:3) {innate_1} {innate_2}];
combined_element_vec = combine_elements (element_vec);

output_str = [];
ne = numel(combined_element_vec);
for j = 1:ne
  output_str = [output_str combined_element_vec{j}];
  if j ~= ne
    output_str = [output_str ' + '];
  end
end
output_str_arr = [output_str_arr;{output_str}];
end

xlswrite(fname,output_str_arr,'Sheet1','F2')

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