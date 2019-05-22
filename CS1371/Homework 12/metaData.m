function [] = metaData (xlsname)
%% read excel file and process
    [num,chars,~] = xlsread(xlsname);
    [~,howmanyplots] = size(num);
    howmanyplots = howmanyplots-1;
    N = ceil(howmanyplots/2);
    x = num(:,1);
    xtitle = chars{1};
%% Write loop to plot
    figure(2)
    for i = 1:howmanyplots
        subplot(2,N,i);
        xlabel(xtitle);
        ylabel(chars{i+1});
        hold on
        plot(x,num(:,i+1),'k');
        plot(x,num(:,i+1),'k.');
        hold off
    end
end