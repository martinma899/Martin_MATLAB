clc;clear;close all

x = linspace(0,1,101);

%exact

u_norm_exact = 1/pi^2*(cos(pi*x)-1);

% ritz
A = [1 1 1;1 4/3 3/2;1 3/2 9/5];
b = [-2/pi^2;-2/pi^2;-3*(pi^2-4)/pi^4];

sol = inv(A)*b
u_norm_ritz = sol(1)*x+sol(2)*x.^2+sol(3)*x.^3;

% galerkin
A = [-4/3 -5/2 -18/5;-5/2 -24/5 -7;-18/5 -7 -72/7];
b = [-2/pi^2;3*-(pi^2+4)/pi^4;-4/pi^2-24/pi^4];

sol = inv(A)*b
u_norm_galerkin = (-2*x+x.^2)*sol(1)+(-3*x+x.^3)*sol(2)+(-4*x+x.^4)*sol(3);

% least square
A = [4 6 8;6 12 18;8 18 144/5];
b = [0;12/pi^2;24/pi^2];

sol = inv(A)*b
u_norm_LS = (-2*x+x.^2)*sol(1)+(-3*x+x.^3)*sol(2)+(-4*x+x.^4)*sol(3);

% collocation
A = [2 3/2 3/4;2 3 3;2 9/2 27/4];
b = [-sqrt(2)/2;0;sqrt(2)/2];

sol = inv(A)*b
u_norm_collocation = (-2*x+x.^2)*sol(1)+(-3*x+x.^3)*sol(2)+(-4*x+x.^4)*sol(3);

hold on
plot(x,u_norm_exact,'k.-')
plot(x,u_norm_ritz)
plot(x,u_norm_galerkin)
plot(x,u_norm_LS)
plot(x,u_norm_collocation)
legend('exact','ritz','galerkin','least square','collocation')
title('Problem 6')
xlabel('x')
ylabel('u')
axis([0 1 -0.25 0])
grid on