xrange = [0 10];
yrange = [0 10];

% draw box
boxx = [xrange(1) xrange(2) xrange(2) xrange(1) xrange(1)];
boxy = [yrange(1) yrange(1) yrange(2) yrange(2) yrange(1)];
close all

xres = 30;
yres = 30;
X = linspace(xrange(1),xrange(2),xres);
Y = linspace(yrange(1),yrange(2),yres);
[x,y] = meshgrid(X,Y);

fps = 30;
halfT = 0.2;
animationres = round(halfT*fps);
framepause = halfT/fps;
amp = linspace(1,3,animationres);
while true
    for i = 1:length(amp)
        u = amp(i)*sin(y);
        v = cos(x);
        plot(boxx,boxy,'k-')
        hold on
        quiver(x,y,u,v)
        hold off
        axis([xrange yrange])
        pause(framepause)
    end
    
    for i = length(amp):-1:1
        u = amp(i)*sin(y);
        v = cos(x);
        plot(boxx,boxy,'k-')
        hold on
        quiver(x,y,u,v)
        hold off
        axis([xrange yrange])
        pause(framepause)
    end
    for i = 1:length(amp)
        u = sin(y);
        v = amp(i)*cos(x);
        plot(boxx,boxy,'k-')
        hold on
        quiver(x,y,u,v)
        hold off
        axis([xrange yrange])
        pause(framepause)
    end
    
    for i = length(amp):-1:1
        u = sin(y);
        v = amp(i)*cos(x);
        plot(boxx,boxy,'k-')
        hold on
        quiver(x,y,u,v)
        hold off
        axis([xrange yrange])
        pause(framepause)
    end
end