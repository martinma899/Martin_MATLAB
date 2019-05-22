function [newxx,newyy,newzz] = rotateObject (xx,yy,zz,axis,t)

    [a,b] = size(xx);
    long = a*b;
    newxx = zeros(a,b);
    newyy = zeros(a,b);
    newzz = zeros(a,b);
    
    
    switch lower(axis)
        case 'x'
            for i = 1:long
            vec = [1,0,0;
                   0,cos(t),-sin(t);
                   0,sin(t),cos(t)] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
        case 'y'
            for i = 1:long
            vec = [cos(t),0,sin(t);
                   0,1,0;
                   -sin(t),0,cos(t)] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
        case 'z'
            for i = 1:long
            vec = [cos(t),-sin(t),0;
                   sin(t),cos(t),0;
                   0 0 1] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
    end

end