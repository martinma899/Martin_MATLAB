clc;clear;close all

ymax = 0.04;
alfa = 5;
rot = -alfa;

upper_original = [0 0;0.5 ymax;1 0]';
lower_original = upper_original;
lower_original(2,:) = -lower_original(2,:);

upper_standard = [cosd(rot) -sind(rot);sind(rot) cosd(rot)]*...
  upper_original;
lower_standard = [cosd(rot) -sind(rot);sind(rot) cosd(rot)]*...
  lower_original;

x = upper_original(1,:);
alfarad = alfa*pi/180;
upper_approx = upper_original;
lower_approx = lower_original;
upper_approx(2,:) = upper_approx(2,:)-x*alfarad;
lower_approx(2,:) = lower_approx(2,:)-x*alfarad;


figure(1)
hold on
plot_original = [upper_original lower_original(:,end:-1:1)];
plot_original_x = plot_original(1,:);
plot_original_y = plot_original(2,:);

plot_standard = [upper_standard lower_standard(:,end:-1:1)];
plot_standard_x = plot_standard(1,:);
plot_standard_y = plot_standard(2,:);

plot_approx = [upper_approx lower_approx(:,end:-1:1)];
plot_approx_x = plot_approx(1,:);
plot_approx_y = plot_approx(2,:);

plot(plot_original_x,plot_original_y,'ks-')
plot(plot_standard_x,plot_standard_y,'rs-')
plot(plot_approx_x,plot_approx_y,'bs-')


axis equal