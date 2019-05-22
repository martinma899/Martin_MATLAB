function [corr] = intervention(st)
%% Calculate

    corr = 'screw you lemme finish first';
    x = st.X;
    y = st.Y;
    xinterp = linspace(st.minX,st.maxX,st.numPoints);
    numPoints = st.numPoints;
    meany = mean(y);
    
    % interp1
    yinterp1 = interp1(x,y,xinterp);
    R2interp1 = (sum((yinterp1-meany).^2)/numPoints)/...
                (sum((y-meany).^2)/length(x));
    % spline
    yspline = interp1(x,y,xinterp,'spline');
    R2spline = (sum((yspline-meany).^2)/numPoints)/...
            (sum((y-meany).^2)/length(x));
    % polyval
    coeffs = polyfit(x,y,st.Power);
    ypoly = polyval(coeffs,xinterp);
    R2poly = (sum((ypoly-meany).^2)/numPoints)/...
                (sum((y-meany).^2)/length(x));
    corr = [R2interp1 R2spline R2poly];
    corr = round(corr,4);
    
%% Plot
    figure(2)

    subplot(1,3,1)

        xlabel('x-axis')
        ylabel('y-axis')
        plot(x,y,'b*'),hold on
        plot(xinterp,yinterp1,'g*'),hold off
        titlestr = ['Interp1: R^2 = ' sprintf('%0.4f',R2interp1)];
        title(titlestr)
        
    subplot(1,3,2)
    
        xlabel('x-axis')
        ylabel('y-axis')
        plot(x,y,'b*'),hold on
        plot(xinterp,yspline,'g*'),hold off
        titlestr = ['Spline: R^2 = ' sprintf('%0.4f',R2spline)];
        title(titlestr)
        
    subplot(1,3,3)
        xlabel('x-axis')
        ylabel('y-axis')
        plot(x,y,'b*'),hold on
        plot(xinterp,ypoly,'g*'),hold off
        titlestr = ['Polyfit/Polyval: R^2 = ' sprintf('%0.4f',R2poly)];
        title(titlestr)
        
end