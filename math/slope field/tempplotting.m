x = linspace(0,1.5,1000);
y = x.^(2/3)-x;

close all
hold on
plot(x,y,'b-')
plot(x,y*0,'k-')
hold off
xlabel('y')
ylabel('f(y)')
title('Chapter 1.2 problem 34 a')