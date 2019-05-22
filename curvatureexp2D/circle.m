function circle (O,r)
    t = linspace(0,2*pi,1000);
    x = r*cos(t)+O(1);
    y = r*sin(t)+O(2);
    plot(x,y,'r-');
end