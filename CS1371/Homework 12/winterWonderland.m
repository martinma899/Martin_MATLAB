function [] = winterWonderland (long,bch,spec)
    figure(2)
    global branches;
    global subbranchfactor;
    branches = bch;
    global theta
    global waysofrecursion;
    waysofrecursion = spec(2);
    switch spec(1)
        case 'n'
            theta = 0;
            subbranchfactor = 0;
        case 'p'
            theta = 360/branches;
            subbranchfactor = 0.5;
        case 's'
            theta = 360/branches;
            subbranchfactor = 1;
        case 'r'
            theta = 720/branches;
            subbranchfactor = 0.5;
    end
    hold on
        recursion(long);
    hold off
end

function [aout] = recursion (a)
    global waysofrecursion
    global subbranchfactor
    if a<5
        aout = a;
    else
        produceoneringbranch(a,a*subbranchfactor)
        switch waysofrecursion
            case 'h'
                [aout] = recursion(a-200/a);
            case 'e'
                [aout] = recursion(a-10);
            case 't'
                [aout] = recursion(a^0.85);
        end
    end
end

function [] = produceoneringbranch(a,r)
    global branches
    global theta
    bigangle = 360/branches;
    hold on
    for rotation = linspace(0,360-bigangle,branches)
        x = [0 a a+r*cosd(theta) a a+r*cosd(theta)];
        y = [0 0 r*sind(theta) 0 -r*sind(theta)];

        out = [cosd(rotation),-sind(rotation);sind(rotation),cosd(rotation)]...
            *[x;y];
        x = out(1,:);
        y = out(2,:);
        plot(x,y,'b');
        axis square
        axis off
    end
end