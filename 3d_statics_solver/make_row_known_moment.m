function trow = make_row_known_moment(body_index,name,x_comp,y_comp,z_comp,scale)
vnms = {'body_index','name','x_comp','y_comp','z_comp','scale'};
trow = table(body_index,name,x_comp,y_comp,z_comp,scale,'VariableNames',vnms);
end