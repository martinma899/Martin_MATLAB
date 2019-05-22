function dxdt = f(t,x,ubar,tlist,m,k,b)
  F = interp1(tlist,ubar,t,'spline','extrap');
  dxdt = [x(2);-k/m*x(1)-b/m*x(2)+1/m*F];

end