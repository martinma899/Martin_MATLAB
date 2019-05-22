clc;clear;close all

% system parameters.
m = 20;
ma = 5;
b = 20;
k = 30;

% damping ratio, natural frequency, damped frequency. 
zeta = b/(2*sqrt(m*k))
omega_n = sqrt(k/m)
omega_d = omega_n*sqrt(1-zeta^2)

% forcing amplitude and frequency. 
omega_f = 5 % choose frequency at resonance
P = 5
beta = omega_f/omega_n

% choose spring constant of shock absorber
ka = omega_f^2*ma

% ODE45 produce real response
tf = 100;
xvec0 = [0;0;0;0];
[tlist,xlist] = ode45(@(t,x) SMD_Shock_Absorber_sin_forcing(t,x,m,ma,k,ka,b,P,omega_f),[0 tf],xvec0);
[tlist2,xlist2] = ode45(@(t,x) SMD_sin_forcing(t,x,m,k,b,P,omega_f),[0 tf],[0;0]);

% compute theoretical steady state vibratory response (particular solution)
G_jw = (-ma*omega_f^2+ka)/((-m*omega_f^2+b*omega_f*1i+ka+k)*(-ma*omega_f^2+ka)-ka^2)
absG_jw = abs(G_jw)
phi = angle(G_jw)
eq_forced_response = absG_jw*P*sin(omega_f*tlist+phi);

% compute TR - beta relation with shock absorber
beta_list = linspace(0,beta*2,501);
omega_f_list = beta_list*omega_n;
G_jw_list = (-ma*omega_f_list.^2+ka)./...
  ((-m*omega_f_list.^2+b*omega_f*1i+ka+k).*(-ma*omega_f_list.^2+ka)-ka^2);
TR_list = abs(k+b*1i*omega_f_list).*abs(G_jw_list);
TR = interp1(beta_list,TR_list,beta,'spline')

% computer TR - beta relation without shock absorber
% compute TR - beta relation
TR_list_no_absorber = sqrt(1+(2*zeta*beta_list).^2)./...
  sqrt((1-beta_list.^2).^2+(2*zeta*beta_list).^2);

TR_ceil = 10;
TR_list(TR_list>TR_ceil) = TR_ceil;
TR_list_no_absorber(TR_list_no_absorber>TR_ceil) = TR_ceil;

subplot(2,1,1)
title('Complete and steady state solutions of mbk system with sine input')
xlabel('t'), ylabel('x')
hold on, grid on
plot(tlist,xlist(:,1),'b.-')
plot(tlist2,xlist2(:,1),'y.-')
plot(tlist,eq_forced_response,'r.-')
legend('Complete Response','Response without SA','Steady State Response')

subplot(2,1,2)
title('TR vs. beta')
xlabel('beta'), ylabel('TR')
hold on, grid on
ymax = max([TR_list TR_list_no_absorber]);
axis([0 beta*2 0 ymax])
text(beta,ymax/2,sprintf(' zeta = %1.4f \n beta = %1.4f \n TR = %1.4f',zeta,beta,TR))
plot([beta beta],[0 ymax],'b-');
plot(beta_list,TR_list,'b.-');
plot(beta_list,TR_list_no_absorber,'k.-');
plot(beta,TR,'rd')






