function trow = make_row_unknown_force(body_index,name,x_loc,y_loc,z_loc,x_dir,y_dir,z_dir,scale)
vnms = {'body_index','name','x_loc','y_loc','z_loc','x_dir','y_dir','z_dir','scale'};
trow = table(body_index,name,x_loc,y_loc,z_loc,x_dir,y_dir,z_dir,scale,'VariableNames',vnms);
end