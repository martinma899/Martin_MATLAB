function [dxdt] = helicopter(t,x,thr,c1,c2,uv,tuv)

u = interp1(tuv,uv,t,'spline');
dxdt(1) = c1*cos(x(2))+c2*u;
dxdt(2) = x(1);
dxdt(3) = thr-x(2);

end