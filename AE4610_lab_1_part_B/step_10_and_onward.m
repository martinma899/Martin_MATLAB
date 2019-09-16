clear;close all

plot([0 30],[0 30]);
hold on

Kp = 3.12954;
Kd = 0.28409;
Ki = 0;

out1 = sim('simulink_model.slx')
plot(out1.tout,out1.ramp_input_out)

Ki = 0.05;

out2 = sim('simulink_model.slx')
plot(out2.tout,out2.ramp_input_out)

legend('input','PD','PID')
grid on

figure

hold on
plot(out1.tout,out1.tout-out1.ramp_input_out)
plot(out2.tout,out2.tout-out2.ramp_input_out)
grid on
legend('PD error','PID error')
