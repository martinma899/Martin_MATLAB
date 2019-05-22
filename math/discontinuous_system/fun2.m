function dydt = fun2 (t,y)
    dydt = [y(2);-sin(y(1)-0.5)];
end