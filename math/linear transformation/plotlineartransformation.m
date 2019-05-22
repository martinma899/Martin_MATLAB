function [] = plotlineartransformation (A,win,intensity)

    rmax = max(win(2)-win(1),win(4)-win(3))/2;
    t = linspace(0,2*pi,intensity*5);
    r = linspace(0,rmax,intensity);
    [rr,tt] = meshgrid(r,t);
    close all
    hold on
    
    for i = 1:numel(rr)
        for j = 1:numel(tt)
            original = [rr(i)*cos(tt(i));rr(i)*sin(tt(i))];
            transformed = A*original;
            figure(1)
            plot(original(1),original(2),'k.');
            plot(transformed(1),transformed(2),'r.');
            
        end
    end

    hold off
    
end