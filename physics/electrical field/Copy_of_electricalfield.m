function [dataarr] = Copy_of_electricalfield (charges,win) 
% charge is n*3 array

    hold on
    
    k = 8.99e9; % electrical constant
    
    % x and y test charge points
    x = [-0.01]; 
    y = [0];
    
    % length of arrow decoration
    declength = max(win(2)-win(1),win(4)-win(3))/50; 
    
    % count amount of charges
    [amtcharge,~] = size(charges);
    
    % empty array for recording every vector to be graphed
    dataarr = [];
    
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
    
    % make a copy of dataarr
    dataarrplot = dataarr;
    
    % find a scale factor 
    biggestmag = max(dataarr(:,3));
    fac = (max(win(2)-win(1),win(4)-win(3))/5)/biggestmag;
    
    % change magnitudes accordingly 
    dataarrplot(:,1:2) = dataarrplot(:,1:2)*fac;
    
    % plot all vectors
    [s,~] = size(dataarrplot);
    for i = 1:s
        drawvector(dataarrplot(i,1:2)...
            ,dataarrplot(i,4:5),declength);
    end
    axis(win);
    axis equal
    
    hold off

end