function [dataarr] = electricaldipole(Qin,Lin,win,intensity)
    global Q;
    global L;
    Q = Qin;
    L = Lin;

    %Columb constant
    k = 8.99e9;
    % length of arrow decoration and vectors
    r = max(win(2)-win(1),win(4)-win(3))/200; 
    rl = max(win(2)-win(1),win(4)-win(3))/intensity;
    % initialize dataarr
    dataarr = [];
    
    close all
    % draw the rectangle
    width = (win(4)-win(3))/100;
    xrec = [0 L L 0 0];
    yrec = [width/2 width/2 -width/2 -width/2 width/2];
    plot(xrec,yrec,'b-');
    
    hold on
    for y = linspace(0,win(4)-win(3),intensity)+win(3)
        for x = linspace(0,win(2)-win(1),intensity)+win(1)
            vec = [Ex(x,y) Ey(x,y)];
            offset = [x y];
            drawdirection(vec,offset,r,rl);
            axis(win);
            pause(0.01)
        end
    end
    hold off
end

function out = Ex (x,y)
    global Q;
    global L;
    k = 8.99e9;
    out = -2*k*Q*log(-(-sqrt(x^2-2*L*x+y^2+L^2)+x-L))/L...
          +2*k*Q*log(-(x-sqrt(x^2+y^2)))/L...
          +k*Q/sqrt(x^2-2*L*x+y^2+L^2)...
          +k*Q/sqrt(x^2+y^2);
end

function out = Ey (x,y)
    global Q;
    global L;
    k = 8.99e9;
    out = k*Q*(sqrt(x^2-2*L*x+y^2+L^2)*(2*x^2-L*x+2*y^2)...
          -sqrt(x^2+y^2)*(2*x^2-3*L*x+2*y^2+L^2))...
          /(L*sqrt((x^2+y^2)*(x^2-2*L*x+y^2+L^2))*y);
end

function [] = drawdirection(vec,offset,r,rl)
% r is the length of arrow head
% lr is the length of vector body

    theta = atand(vec(2)/vec(1));
    if vec(1)<0
        theta = theta+180;
    end
    
    % find standard arrowhead scaled by r
    unitarrow = [-sqrt(3)*r/2 -sqrt(3)*r/2;r/2 -r/2];
    
    % find the tail of the vector
    tail = rl/2*[cosd(theta+180);sind(theta+180)];
    % find the head of the vector
    head = rl/2*[cosd(theta);sind(theta)];
    
    % rotate the arrow head and add to vec
    for i = 1:2
        unitarrow(:,i) = [cosd(theta) -sind(theta);...
                         sind(theta) cosd(theta)]*unitarrow(:,i);
        unitarrow(:,i) = unitarrow(:,i)+head;
    end
    
    plotarr = [tail head unitarrow(:,1) head unitarrow(:,2)];
    
    for i = 1:5
        plotarr(:,i) = plotarr(:,i)+offset';
    end
    
    plot(plotarr(1,:),plotarr(2,:),'b-');

end