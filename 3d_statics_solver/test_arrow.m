clc;clear;close all

figure(1);ax = gca;hold on; axis equal;grid on;

x = 1;
y = 1; 
z = 1; 
xcomp = 1;
ycomp = 1;
zcomp = 1;
txt = 'test force';
scale = 0.1;
acolor = [0 0 0];
pcolor = [1 0 0];
head_size = 0.02;
head_angle = 5; 

plot_arrow(ax,x,y,z,xcomp,ycomp,zcomp,txt,scale,acolor,pcolor,head_size,head_angle)