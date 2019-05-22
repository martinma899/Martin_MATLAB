fidgeom = fopen('RAE2822mod.geom','r');
scanresult = textscan(fidgeom,'%f %f');
plot(scanresult{1},scanresult{2},'b-')
hold off
axis([-10 10 -10 10])
axis square