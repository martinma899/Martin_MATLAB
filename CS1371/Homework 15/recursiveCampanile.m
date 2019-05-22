function [] = recursiveCampanile (b,theta,c)

    hold on;view(3);
    global color;global long;global angle;
    color = c;long = length(color);angle = theta;
    
    rechelper (b,0,0);
    
    hold off
end

function rechelper (base,rotation,height)

    global color
    global long
    global angle

    if base>=1
        [x,y,z] = makesquare(base,rotation,height);
        plotspec = color(mod(height,long)+1);
        plot3(x,y,z,plotspec);
        axis equal;xlabel('x-axis');ylabel('y-axis');zlabel('z-axis');
        title('My Campanile');
        rechelper(base*0.9,rotation+angle,height+1);
    end

end

function [x,y,z] = makesquare(base,rotation,height)

    x = base/2*[1,-1,-1,1,1];
    y = base/2*[1,1,-1,-1,1];
    
    for i = 1:5
        vec = [cos(rotation) -sin(rotation); ...
               sin(rotation) cos(rotation)] * ...
               [x(i);y(i)];
        x(i) = vec(1);
        y(i) = vec(2);
    end
    
    z = ones(1,5)*height;
end