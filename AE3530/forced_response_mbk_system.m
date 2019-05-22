clc;clear;close all

% system parameters.
m = 20;
b = 1;
k = 30;

% damping ratio, natural frequency, damped frequency. 
zeta = b/(2*sqrt(m*k))
omega_n = sqrt(k/m)
omega_d = omega_n*sqrt(1-zeta^2)

% forcing amplitude and frequency. 
omega_f = 1.5
P = 50
beta = omega_f/omega_n

TR = sqrt((2*zeta*beta)^2+1)/sqrt((1-beta^2)^2+(2*zeta*beta)^2)

% ODE45 produce real response
tf = 20;
xvec0 = [0;0];
[tlist,xlist] = ode45(@(t,x) SMD_sin_forcing(t,x,m,k,b,P,omega_f),[0 tf],xvec0);

% compute theoretical steady state vibratory response (particular solution)
G_jw = 1/(m*(1i*omega_f)^2+b*(1i*omega_f)+k)
absG_jw = abs(G_jw)
phi = angle(G_jw)
eq_forced_response = absG_jw*P*sin(omega_f*tlist+phi);

% compute TR - beta relation
beta_list = linspace(0,beta*2,501);
TR_list = sqrt(1+(2*zeta*beta_list).^2)./...
  sqrt((1-beta_list.^2).^2+(2*zeta*beta_list).^2);


subplot(2,1,1)
title('Complete and steady state solutions of mbk system with sine input')
xlabel('t'), ylabel('x')
hold on, grid on
plot(tlist,xlist(:,1),'b.-')
plot(tlist,eq_forced_response,'r.-')
legend('Complete Response','Steady State Response')

subplot(2,1,2)
title('TR vs. beta')
xlabel('beta'), ylabel('TR')
hold on, grid on
axis([0 beta*2 0 max(TR_list)])
text(beta,max(TR_list)/2,sprintf(' zeta = %1.4f \n beta = %1.4f \n TR = %1.4f',zeta,beta,TR))
plot([beta beta],[0 max(TR_list)],'b-');
plot(beta_list,TR_list,'b.-');
plot(beta,TR,'rd')





