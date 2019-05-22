function [dxdt] = helicopter_manualInput(t,x,thr,cvec,uv,tuv)

dxdt = zeros(3,1);
u = interp1(tuv,uv,t);
dxdt(1) = cvec(1)*cosd(x(2))+cvec(2)*u+cvec(3)*x(1);
dxdt(2) = x(1);
dxdt(3) = thr-x(2);

end