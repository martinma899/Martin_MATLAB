function plotrectangle (posx,posy,w,h,ax,spec)
    hold on
    x = [posx-w/2 posx+w/2 posx+w/2 posx-w/2 posx-w/2];
    y = [posy-h/2 posy-h/2 posy+h/2 posy+h/2 posy-h/2];
    plot(x,y,spec)
    axis(ax)
end