function dxdt = finit(t,x,F,m,k,b)

  dxdt = [x(2);-k/m*x(1)-b/m*x(2)+1/m*F];

end