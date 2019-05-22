function plotCircle (vec,r,res)

    t = linspace(0,2*pi,res);
    x = r*cos(t)+vec(1);
    y = r*sin(t)+vec(2);
    plot(x,y);

end