function [r,t,z] = plot2Dfunctionpolar (func,rrange,trange,rres,tres,zcutoff,edge)

%     plot2Dfunction('12-x.^2-y.^2',[-10 10],[-10 10],100,100,[-100 50]);
    
    R = linspace(rrange(1),rrange(2),rres);
    T = linspace(trange(1),trange(2),tres);

    [r,t] = meshgrid(R,T);

    x = r.*cos(t);
    y = r.*sin(t);
    
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