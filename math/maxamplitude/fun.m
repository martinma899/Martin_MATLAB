function dydt = fun (t,y,omega)
    dydt = [y(2);-y(1)-0.1*y(2)+cos(omega*t)];
end