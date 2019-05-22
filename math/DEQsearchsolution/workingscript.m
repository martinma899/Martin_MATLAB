clear
% specify the window size
% x is from 0 to five, y is from 1 to 6
win = [0 5 1 6];
% specify grid resolutions
gridresx = 7;
gridresy = 7;
% generate first set of grid
x1 = linspace(win(1),win(2),gridresx);
y1 = linspace(win(3),win(4),gridresy);
[X1,Y1] = meshgrid(x1,y1);
% calculate the slopes at every point
slope1 = Y1.*(1-Y1);
% specify initial condition and its relative calculations
x0 = 2.46;y0 = 3.21;
slope1ini = y0*(1-y0);
%%%%%%%%%%%%%%%%%%%%%%%%%%%
% these are actually useless, just plotting
% determining length of little segments
length = min((win(2)-win(1))/gridresx,(win(4)-win(3))/gridresy);
close all
plot(x0,y0,'ro');
drawline(slope1ini,length,[x0,y0],'r-');
for i = 1:(gridresx*gridresy)
    drawline(slope1(i),length,[X1(i),Y1(i)],'b-');
end
axis(win)
axis square
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% generate all possible x routes
y1allpermmat = permn(y1,gridresy);
% split up test x with the initial condition
x0loc = find(sort([x1 x0],'ascend')==x0);
y0loc = find(sort([y1 y0],'ascend')==y0);
x1addini = [x1(1:x0loc-1) x0 x1(x0loc:end)];
y1addini = [y1(1:y0loc-1) y0 y1(y0loc:end)];

sizeallpermmat = size(y1allpermmat);
y1inivertaddon = ones(sizeallpermmat(1),1)*y0;
y1allpermmat = [y1allpermmat(:,1:x0loc-1) y1inivertaddon y1allpermmat(:,x0loc:end)];
% start loop calculation, record all differences of slope
errorvec = [];
for i = 1:sizeallpermmat(1)
    y1numroute = y1allpermmat(i,:);
    y1index = find(y1addini,y1numroute(1));
    testslopeprev = slope1(1,y1index);
    errorcum = 0;
    for j = 2:(sizeallpermmat(2)+1)
        y1index = find(y1addini==y1numroute(j));
        testslope = slope1(j,y1index);
        intermediateslope = (y1numroute(j)-y1numroute(j-1))/(x1addini(j)-x1addini(j-1));
        errorcum = errorcum+abs(testslopeprev+testslope-intermediateslope);
        testslopeprev = testslope;
    end
    errorvec = [errorvec errorveccum];
end
