clc;close all

% lay out system parameters

m = 3.4828;
k = 494.33;
b = 0.56063;
zeta = b/2/sqrt(k*m)
t0 = 0.655;
tf = 20;
x0 = -861;

% step 1. produce simulated response

[tsim,xsim] = ode45(@(t,x) SMD(t,x,m,k,b),[t0 tf],[x0;0]);
xsim = xsim(:,1);

% step 2. produce theoretical response

tth = linspace(0,tf,101);
omega_n = sqrt(k/m)
omega_d = omega_n*sqrt(1-zeta^2)
phi = angle(sqrt(1-zeta^2)-zeta*1i);
phid = phi/pi*180

xth = x0*sqrt(1/(1-zeta^2))*exp(-zeta*omega_n*tth).*cos(omega_d*tth+phi);

% xth_fake is with no phi angle added
xth_fake = x0*sqrt(1/(1-zeta^2))*exp(-zeta*omega_n*tth).*cos(omega_d*tth);
xth_fake2 = x0*sqrt(1/(1-zeta^2))*cos(omega_d*tth+phi);

% plot

hold on
plot(tsim,xsim,'k.-');
% % plot(tth,xth,'rd-');
% plot(tth,xth_fake2,'b.-');
legend('simulation')
grid on
