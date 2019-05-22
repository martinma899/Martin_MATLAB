clc;clear;close all

M = 60;
m = 2;
g = 9.81;
l = 1.5;

rho = 2700;

ldisp = l;
Mldisp = (M/rho)^(1/3);
rdisp = ((m/rho)/(4/3*pi))^(1/3);



tf = 10;
x0 = [0;0;0.2*pi;-pi/5];

[t,x] = ode45(@(t,x) f(t,x,M,m,g,l), [0 tf],x0); 

xlist = x(:,1);
thetalist = x(:,3);

for i = 1:length(t)
    
    plotSquare([xlist(i),0],Mldisp);
    axis square
    axis([-2 2 -2 2]);
    grid on
    hold on
    plotCircle([xlist(i),0]+[-ldisp*sin(thetalist(i)),ldisp*cos(thetalist(i))],rdisp,101);
    tempmat = [[xlist(i),0];[xlist(i),0]+[-ldisp*sin(thetalist(i)),ldisp*cos(thetalist(i))]];
    plot(tempmat(:,1),tempmat(:,2));
    text(0,0,sprintf('t = %0.3g',t(i)));
    pause(0.1)
    hold off
    
end

subplot(2,1,1)
plot(t,xlist,'b.-');
subplot(2,1,2)
plot(t,thetalist,'r.-');