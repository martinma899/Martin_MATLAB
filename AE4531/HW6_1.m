clc;clear;close all

A = [-0.045 0.036 0 -32.2;
     -0.369 -2.02 176 0;
     0.0019 -0.0396 -2.9480 0;
     0 0 1 0];

B = [0;0;0;0];

C = [0 1 0 0];

D = 0;

sys = ss(A,B,C,D);

t = linspace(0,300,30001);
u = t*0;
x0 = [-0.1*176;0;0;0];

[w,t,~] = lsim(sys,u,t,x0); 
dh = -cumtrapz(t,w);
h = dh+2000;

plot(t,w,'b.');
grid on
xlabel('time (s)')
ylabel('delta h (ft)')

% monitor theta
% C_ = [0 0 0 180/pi];
% sys_ = ss(A,B,C_,D);
% [theta,t,~] = lsim(sys,u,t,x0);
% figure
% plot(t,theta,'b.');
% grid on

