function [outcome] = defeatZurg (imgname,lazerbeam)

    img = imread(imgname); % read image
    image(img); hold on 
    
    [r,c,~] = size(img);
    
    xrange = [c/3,2*c/3];
    yrange = [0,r/3];
    
    health = 100;
    for i = 1:6
        x = lazerbeam(1,i);
        y = lazerbeam(2,i);
        plot(x,y,'ro');
        if x>=xrange(1)&&x<= xrange(2)&&y>=yrange(1)&&y<=yrange(2)
            health = health-30;
        else
            health = health-10;
        end 
    end
    
    if health <= 0
        outcome = 'YOU DEFEATED ZURG!';
    else
        outcome = 'GAME OVER!';
    end
    hold off
    
end