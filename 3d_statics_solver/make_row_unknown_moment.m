function trow = make_row_unknown_moment(body_index,name,x_dir,y_dir,z_dir,scale)
vnms = {'body_index','name','x_dir','y_dir','z_dir','scale'};
trow = table(body_index,name,x_dir,y_dir,z_dir,scale,'VariableNames',vnms);
end