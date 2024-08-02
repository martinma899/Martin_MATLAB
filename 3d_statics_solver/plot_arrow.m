function plot_arrow(ax,x,y,z,xcomp,ycomp,zcomp,txt,scale,acolor,pcolor,head_size,head_angle)
% ax = axis object
% x y z = location
% xcomp ycomp zcomp = x y z component
% txt = name of force
% scale = scale x y z component
% acolor = arrow color, 1x3 vec
% head_size = arrow head absolute size
% head_angle = arrow head angle

% plot stem
xcomps = xcomp*scale;
ycomps = ycomp*scale;
zcomps = zcomp*scale;

xend = x+xcomps;
yend = y+ycomps;
zend = z+zcomps; 

plot3(ax,[x xend],[y yend],[z zend],'Color',acolor,'Marker','none');
plot3(ax,x,y,z,'Color',pcolor,'Marker','o');

[xx,yy,hh] = gen_unrot_cone(head_size,head_angle);

azim = atan2(ycomp,xcomp);
elev = atan2(zcomp,norm([xcomp ycomp]));

rot_mat_1 = [0 0 1;0 1 0;-1 0 0];

elev_rot_mat = [cos(elev) 0 -sin(elev);
                0         1 0         ;
                sin(elev) 0 cos(elev)];  

azim_rot_mat = [cos(azim) -sin(azim) 0;
                sin(azim)  cos(azim) 0; 
                0          0         1];

comb_rot = azim_rot_mat*elev_rot_mat*rot_mat_1;

n = norm([xcomps;ycomps;zcomps]);

cone_offset = [xcomps;ycomps;zcomps]*(n-head_size)/n+[x;y;z];

for i = 1:numel(xx)
  new_vec = comb_rot*[xx(i);yy(i);hh(i)]+cone_offset;
  xx(i) = new_vec(1);
  yy(i) = new_vec(2);
  hh(i) = new_vec(3);
end

mesh(xx,yy,hh,'FaceColor',[1 1 1],'EdgeColor',acolor,'FaceAlpha',0.1);
text(xend,yend,zend,txt,'VerticalAlignment','bottom');

end

