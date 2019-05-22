function [] = polyFun(x,y,power)

    coeffs = polyfit(x,y,power);
    xp = linspace(min(x),max(x),200);
    yp = polyval(coeffs,xp);
    diffy = diff(y)./diff(x);
    diffyp = diff(yp)./diff(xp);
    intey = cumtrapz(x,y);
    integralcoeff = [coeffs./(power+1:-1:1) 0];
    inteyp = polyval(integralcoeff,xp);
    
    figure(2)
    
    subplot(1,3,1)% plotting the function
    hold on
        plot(x,y,'g')
        plot(xp,yp,'b')
        box on
        title('Original Data')
        xlabel('x axis')
        ylabel('y axis')
    subplot(1,3,2)
    hold on
        plot(xp(1:end-1),diffyp,'g')
        plot(x(1:end-1),diffy,'b')
        box on
        title('Derivative Data')
        xlabel('x axis')
        ylabel('y axis')
    subplot(1,3,3)
    hold on
        plot(x,intey,'b')
        plot(xp,inteyp,'g')
        box on
        title('Integral Data')
        xlabel('x axis')
        ylabel('y axis')
end