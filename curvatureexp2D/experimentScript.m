clc;clear

% data = [1 2;3 4;5 6;7 8]
% diffdata = diff(data,1)
% middata = (data(1:end-1,:)+data(2:end,:))./2

kappaarr_circle = load('kappaarr_circle.mat');
kappaarr_bezier = load('kappaarr_bezier.mat');
x = load('x.mat');

kappaarr_circle = [kappaarr_circle.kappaarr];
kappaarr_bezier = [kappaarr_bezier.kappaarr];
x = [x.x];

semilogy(x,kappaarr_circle,'bs-');
hold on
semilogy(x,kappaarr_bezier,'rx-');