clc;clear;close all

zi = linspace(0,1,101);

l = 1;

u_true_normal = (4/15*log(abs(zi-2)/2)-1/9*zi.^3+1/6*zi.^2+2/3*zi);
u_approx_normal = 77/130*zi-7/130*zi.^2;

N_true_normal = (2-zi).*(4/15./(zi-2)-1/3*zi.^2+1/3*zi+2/3);
N_approx_normal = (2-zi).*(77/130-7/130*2*zi);

hold on
plot(zi,u_true_normal,'k.-')
plot(zi,u_approx_normal,'b.-')
title('Problem 5 Displacement')
xlabel('zi')
ylabel('normalized u')
legend('exact','ritz')
grid on

figure(2)
hold on
plot(zi,N_true_normal,'k.-')
plot(zi,N_approx_normal,'b.-')
title('Problem 5 Axial Force')
xlabel('zi')
ylabel('normalized N')
legend('exact','ritz')
grid on