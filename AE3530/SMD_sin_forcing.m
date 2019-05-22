function dxdt = SMD_sin_forcing(t,x,m,k,b,P,omega_f)
  dxdt = [x(2);-k/m*x(1)-b/m*x(2)+P/m*sin(omega_f*t)];
end