function [dxdt] = helicopter_PID(t,x,thr,cvec,Kp,Kd,Ki)

dxdt = zeros(3,1);
u = Kp*(thr-x(2))-Kd*x(1)+Ki*x(3);
dxdt(1) = cvec(1)*cosd(x(2))+cvec(2)*u+cvec(3)*x(1);
dxdt(2) = x(1);
dxdt(3) = thr-x(2);

end