function oct_ind = uni_ind_2_oct_ind(uni_ind)
% converts universal index to octave index
% uni_ind: from 1 to 108
% oct_ind: from 0 to 8

oct_ind = floor((uni_ind-1)/12);

end