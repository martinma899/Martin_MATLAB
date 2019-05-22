% plot airfoil

% get window size, fix window

% find the interested points
clear;clc;close all

columnnames = {'cell number' 'cell center x location' ...
               'cell center y location' 'cell center z location'...
               'divergence magnitude' 'vorticity' 'pressure gradient'...
               'temperature gradient' 'mach number gradient' ...
               'species gradient' 'vibrational temperature gradient'};

filenumber = 68;
column = 8;
data = getrawdata(filenumber);
xdata = data(:,2);
ydata = data(:,3);


columnofinterest = data(:,column);

figure(1)
histogram(columnofinterest,500);


waittime = 0.5;
intervalofinterest = [0 2];
divisions = 100;
intervalwidth = diff(intervalofinterest)/divisions;
intervalcentersvec = linspace(intervalofinterest(1),...
                              intervalofinterest(2),divisions);
while true
    for i = 1:divisions

        thisinterval = [intervalcentersvec(i)-intervalwidth/2,...
                        intervalcentersvec(i)+intervalwidth/2];
        index = find(columnofinterest>=thisinterval(1)&...
                     columnofinterest<=thisinterval(2));
        xplot = xdata(index);
        yplot = ydata(index);

        figure(2)
        subplot(1,2,1)
        plotairfoil;
        hold on
        plot(xplot,yplot,'r.','MarkerSize',2)
        hold off
        title(sprintf('adaption parameter %f to %f',thisinterval(1),thisinterval(2)));
        subplot(1,2,2)
        histogram(columnofinterest,500);
        axis([0 2 0 1000])
        title(columnnames{column})
        hold on
        rectanglex = [thisinterval(1) ...
            thisinterval(2) ...
            thisinterval(2) ...
            thisinterval(1) ...
            thisinterval(1)];
        rectangley = [0 0 1000 1000 0];
        plot(rectanglex,rectangley,'r-');
        hold off
        pause(waittime)

    end
end