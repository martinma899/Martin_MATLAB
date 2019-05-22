inten = 100;
P = linspace(0,inten);
horizontal = zeros(1,inten);

mew = 0.16;
W = 200;
fneeded = W*sind(10)-P*cosd(15);
N = W*cosd(10)-P*sind(15);
fmaxmag = N*0.16; % here, fmaxmag is always positive. 
fmax = fmaxmag;
fmax(fneeded<0) = -fmax(fneeded<0);

plot(P,fmax,'b--');
hold on
plot(P,fneeded,'b');
plot(P,horizontal,'r-');
hold off
