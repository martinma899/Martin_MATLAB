function [] = drawvector(vec,offset,r)

    theta = atand(vec(2)/vec(1));
    if vec(1)<0
        theta = theta+180;
    end
    
    % find standard arrowhead scaled by r
    unitarrow = [-sqrt(3)*r/2 -sqrt(3)*r/2;r/2 -r/2];
    
    % rotate the arrow head and add to vec
    for i = 1:2
        unitarrow(:,i) = [cosd(theta) -sind(theta);...
                         sind(theta) cosd(theta)]*unitarrow(:,i);
        unitarrow(:,i) = unitarrow(:,i)+vec';
    end
    
    plotarr = [[0;0] vec' unitarrow(:,1) vec' unitarrow(:,2)];
    
    for i = 1:5
        plotarr(:,i) = plotarr(:,i)+offset';
    end
    
    plot(plotarr(1,:),plotarr(2,:),'r-');
    
end