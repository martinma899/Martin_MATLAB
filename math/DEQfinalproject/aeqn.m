function aout = aeqn (t,a,lambda,k,gamma,m,omega,A,ui,z)
    aout = zeros(2,1);
    aout(1) = a(2);
    aout(2) = (k/m*A*sin(omega*t)+gamma/m*A*omega*cos(omega*t))...
        *(dot(ui,z))-lambda*gamma/m*a(2)-lambda*k/m*a(1);
end