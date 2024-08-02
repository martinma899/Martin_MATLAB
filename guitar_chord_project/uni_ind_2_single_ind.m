function single_ind = uni_ind_2_single_ind(uni_ind)
% converts universal index to single chromatic scale index
% uni_ind: from 1 to 108
% single_ind: from 1 to 12

single_ind = mod(uni_ind-1,12)+1;

end