function [dataarr] = electricalfield (charges,win,mode,x,y,intensity)
    
    k = 8.99e9; % electrical constant
    
    % length of arrow decoration
    r = max(win(2)-win(1),win(4)-win(3))/100; 
    
    % count amount of charges
    [amtcharge,~] = size(charges);
    
    % empty array for recording every vector to be graphed
    dataarr = [];
    
    
    if strcmp(mode,'auto')||strcmp(mode,'auto-direction')
    % x and y test charge points
    x = linspace(0,win(2)-win(1),intensity)+win(1); 
    y = linspace(0,win(4)-win(3),intensity)+win(3);
    
    for i = x
        for j = y
            test = [i j]; % coordinate of a test charge
            E = [0 0]; % initiailze electric field for addition
            for c = 1:amtcharge
                charge = charges(c,:); 
                chargecoord = charge([1 2]); % coordinate of the charge
                q = charge(3); % how big the charge is
                % calculate directional unit vector
                if q>0
                    unit = (test-chargecoord)/dist(test,chargecoord);
                elseif q<=0
                    unit = (chargecoord-test)/dist(test,chargecoord);
                end
                % calculate the magnitude of the electrical field
                Emag = k*abs(q)/dist(test,chargecoord)^2;
                % calculate the electric field vector of this test position
                Ethis = unit*Emag;
                % calculate the cumulated E for this test coordinate
                E = E+Ethis;
            end
            dataarr = [dataarr;[E sqrt(sum(E.^2)) test]];
        end
    end
    elseif strcmp(mode,'manual')
        for i = 1:length(x)
            test = [x(i) y(i)]; % coordinate of a test charge
            E = [0 0]; % initiailze electric field for addition
            for c = 1:amtcharge
                charge = charges(c,:); 
                chargecoord = charge([1 2]); % coordinate of the charge
                q = charge(3); % how big the charge is
                % calculate directional unit vector
                if q>0
                    unit = (test-chargecoord)/dist(test,chargecoord);
                elseif q<=0
                    unit = (chargecoord-test)/dist(test,chargecoord);
                end
                % calculate the magnitude of the electrical field
                Emag = k*abs(q)/dist(test,chargecoord)^2;
                % calculate the electric field vector of this test position
                Ethis = unit*Emag;
                % calculate the cumulated E for this test coordinate
                E = E+Ethis;
            end
            dataarr = [dataarr;[E sqrt(sum(E.^2)) test]];
        end
    else
        error('Type a valid mode.')
    end
    
    % make a copy of dataarr
    dataarrplot = dataarr;
    
    % find a scale factor 
    biggestmag = max(dataarr(:,3));
    fac = (max(win(2)-win(1),win(4)-win(3))/5)/biggestmag;
    
    % change magnitudes accordingly 
    dataarrplot(:,1:2) = dataarrplot(:,1:2)*fac;
    
    % plot all vectors
    [s,~] = size(dataarrplot);
    
    close all
    hold on
    if strcmp(mode,'auto-direction')
        rl = max(win(2)-win(1),win(4)-win(3))/30;
        for i = 1:s
            drawdirection(dataarrplot(i,1:2),dataarrplot(i,4:5),r,rl);
        end
    else
        %for i = 1:s
        %    drawvector(dataarrplot(i,1:2),dataarrplot(i,4:5),r);
        %end
    end
    axis(win);
    axis equal
    
    hold off

end

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
    
    plot(plotarr(1,:),plotarr(2,:),'b-');
    
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