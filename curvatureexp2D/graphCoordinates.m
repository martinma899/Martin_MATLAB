function graphCoordinates (coords,figurenum)
    figure(figurenum);
    hold on
    plot(coords(:,1),coords(:,2),'b.');
    plot(coords(:,1),coords(:,2),'b-');
end