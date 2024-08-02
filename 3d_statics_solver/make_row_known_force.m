function trow = make_row_known_force(body_index,name,x_loc,y_loc,z_loc,x_comp,y_comp,z_comp,scale)
vnms = {'body_index','name','x_loc','y_loc','z_loc','x_comp','y_comp','z_comp','scale'};
trow = table(body_index,name,x_loc,y_loc,z_loc,x_comp,y_comp,z_comp,scale,'VariableNames',vnms);
end