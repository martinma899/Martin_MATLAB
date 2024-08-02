function uni_ind = calc_uni_ind (oct_ind,single_ind)
% converts octave index and single chromatic scale index to universal index
% uni_ind: from 1 to 108
% oct_ind: from 0 to 8
% single_ind: from 1 to 12

uni_ind = single_ind+oct_ind*12;

end