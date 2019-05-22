function [x,y,z] = plot2Dfunction (func,xrange,yrange,xres,yres,zcutoff,edge)

%     plot2Dfunction('12-x.^2-y.^2',[-10 10],[-10 10],100,100,[-100 50]);
    X = linspace(xrange(1),xrange(2),xres);
    Y = linspace(yrange(1),yrange(2),yres);

    [x,y] = meshgrid(X,Y);

    eval(['z = ' func ';']);

    z(z>zcutoff(2)) = zcutoff(2);
    z(z<zcutoff(1)) = zcutoff(1);

    %% plot
    switch edge
        case 0
            surf(x,y,z,'meshstyle','both','facealpha',0.5,'edgecolor','none')
        case 1
            surf(x,y,z,'meshstyle','both','facealpha',1)
    end
    %lightpos = [mean(xrange),mean(yrange),...
    %    0.3*abs(max(max(z))-min(min(z)))+max(max(z))];
    %light('Position',lightpos,'Style','local')
    axis square
end