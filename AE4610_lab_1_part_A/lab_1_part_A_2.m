clear;close all

load('246_sine_OL_3V_3rads.mat')

plot(time,theta_dot,'b.-')

sim('simulink_model.slx')

hold on
plot(time_simu,theta_dot_simu,'r-')

xlabel('time t (s)','Interpreter','latex')
ylabel('motor angular velocity $\omega$ (rad/s)','Interpreter','latex')
legend('experimental data','simulink model')
grid on