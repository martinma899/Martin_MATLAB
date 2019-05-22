function dxdt = SMD(t,x,m,k,b)
  dxdt = [x(2);-k/m*x(1)-b/m*x(2)];
end