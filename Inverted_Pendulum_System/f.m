function [xdot] = f(t,x,M,m,g,l)

    % states: x1 = x, x2 = xdot, x3 = theta, x4 = thetadot

    xddot = (m*l*x(4)^2*sin(x(3))-m*g*sin(x(3))*cos(x(3)))/(-(M+m)+m*(cos(x(3))^2));

    thetaddot = (m*g*sin(x(3))+m*cos(x(3))*xddot)/(m*l);
    
    xdot = [x(2);xddot;x(4);thetaddot];

end