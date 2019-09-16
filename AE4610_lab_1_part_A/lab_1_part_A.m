clear;close all

% load the file we work with
input_gain = 4;
load(['246_DCMotor_OL_' num2str(input_gain) 'V.mat'])
%load('246_sine_OL_3V_3rads.mat')

% theta_dot_s = theta_dot;
theta_dot_s = smooth(time,theta_dot,10,'rloess');

% plot 
plot(time,theta_dot,'b-')
grid on

axis([0 max(time) 0 24])

% take 300-1001 data points and average to find steady state value
SS = mean(theta_dot(300:1001))
DC_gain = SS/input_gain

hold on
plot([time(1) time(end)],[SS,SS],'k-')
[~,tau_ind] = min(abs(theta_dot_s/SS-0.63212));
tau = time(tau_ind)

plot(tau,theta_dot_s(tau_ind),'rd')

tautext = sprintf('$\\quad\\leftarrow \\tau_m=%1.2fs$',tau);
text(tau,theta_dot_s(tau_ind),tautext,'Interpreter','latex')
%titlestr = ['DC motor velocity response experimental, input voltage = ' num2str(input_gain) 'V'];
%title(titlestr)
xlabel('time t (s)','Interpreter','latex')
ylabel('motor angular velocity $\omega$ (rad/s)','Interpreter','latex')
legend('experimental velocity response','estimated steady state value')