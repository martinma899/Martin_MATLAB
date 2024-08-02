function str = uni_ind_2_str(uni_ind,sharp)
% converts universal index to string
% in the format of accidental - note - octave
% sharp: true = sharp, else = flat

single_ind = uni_ind_2_single_ind(uni_ind);
oct_ind = uni_ind_2_oct_ind(uni_ind);

sharp_arr = {' C' '#C' ' D' '#D' ' E' ' F' '#F' ' G' '#G' ' A' '#A' ' B'};
flat_arr  = {' C' 'bD' ' D' 'bE' ' E' ' F' 'bG' ' G' 'bA' ' A' 'bB' ' B'};

if any(single_ind == [1 3 5 6 8 10 12])
  str = [sharp_arr{single_ind} char(oct_ind+48)];
else
  if sharp
    str = [sharp_arr{single_ind} char(oct_ind+48)];
  else
    str = [flat_arr{single_ind} char(oct_ind+48)];
  end
end

end