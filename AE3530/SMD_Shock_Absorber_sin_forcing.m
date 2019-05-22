function dxdt = SMD_Shock_Absorber_sin_forcing(t,x,m,ma,k,ka,b,P,omega_f)
  dxdt = [x(2);
       -(ka+k)/m*x(1)-b/m*x(2)+ka/m*x(3)+P/m*sin(omega_f*t);
       x(4);
       -ka/ma*x(3)+ka/ma*x(1)];
end