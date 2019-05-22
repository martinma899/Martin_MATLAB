% define parameters
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
% define x and y
x = linspace(xrange(1),xrange(2),resolution);
y = linspace(yrange(1),yrange(2),resolution);
[X,Y] = meshgrid(x,y);
% calculate slope field with DEQ
slope = Y.*log(1./Y);
% draw slope field
close all
for i = 1:resolution^2
    drawline(slope(i),length,[X(i),Y(i)]);
end
axis([xrange yrange])
xlabel('t');
ylabel('y');
title('Chapter 1.2 problem 23')
