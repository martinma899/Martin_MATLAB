%% initialization commands
close all;hold on;clear;clc
%% define range
xrange = [0 6];
yrange = [0 6];
if(xrange(1)>xrange(2))
    xrange = xrange([2 1]);
end
if(yrange(1)>yrange(2))
    yrange = yrange([2 1]);
end
resolution = 30;
length = min(abs(xrange(2)-xrange(1)),abs(yrange(2)-yrange(1)))/...
    (resolution);
%% first draw slope field
% define x and y
x = linspace(xrange(1),xrange(2),resolution);
y = linspace(yrange(1),yrange(2),resolution);
[X,Y] = meshgrid(x,y);
% calculate slope field with DEQ
slope = eqn(X,Y);
% draw slope field
close all
for i = 1:resolution^2
    drawline(slope(i),length,[X(i),Y(i)]);
end
%% improved euler approximations
% define increment h

































%% fix the plot
axis([xrange yrange])
xlabel('x');
ylabel('y');