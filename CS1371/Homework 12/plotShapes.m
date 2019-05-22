function [] = plotShapes(shapename,length,rotation,translation)

    shapename = lower(shapename);
    
    switch shapename
        case 'circle'
            theta = linspace(0,180,101);
            x = length/2.*cosd(theta)+translation(1);
            y = length/2.*sind(theta)+translation(2);
        case 'square'
            theta = linspace(45,45+360,5)-rotation;
            x = length/sqrt(2).*cosd(theta)+translation(1);
            y = length/sqrt(2).*sind(theta)+translation(2);
    end
    
    figure(2)
    plot(x,y,'k')
    axis([-length,length,-length,length])
    axis square
end