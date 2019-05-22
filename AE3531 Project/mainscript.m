clc;clear;close all

% read the data in
data1 = csvread('PIDdata2.csv',1,0);

Hz = 100;
dt = 1/Hz;

th = data1(:,1);
u = data1(:,2);
thd = zeros(numel(th),1);

for i = 1:numel(th)
  if i == 1
    thd(i) = (th(i+1)-th(i))/dt;
  elseif i == numel(th)
    thd(i) = (th(i)-th(i-1))/dt;
  else
    thd(i) = (th(i+1)-th(i-1))/(2*dt);
  end
end

thd = smooth(thd,10);

thdd = zeros(numel(thd),1);
for i = 1:numel(thd)
  if i == 1
    thdd(i) = (thd(i+1)-thd(i))/dt;
  elseif i == numel(thd)
    thdd(i) = (thd(i)-thd(i-1))/dt;
  else
    thdd(i) = (thd(i+1)-thd(i-1))/(2*dt);
  end
end

thdd = smooth(thdd,10);

A = [cosd(th) u thd];
b = thdd;

cvec = (A'*A)^(-1)*A'*b

%cvec = [cvec;0;0;0]

% cos constant, u constant, theta constant (linear spring due to
% wire), constant (spring due to wire), theta dot (small damping)

thr = 0;
uv = data1(:,2);
uv = smooth(uv,5);
tuv = linspace(0,dt*(numel(uv)-1),numel(uv));
t0 = 0;
tf = dt*(numel(uv)-1);
% thetainitdeg = -59;

Kp = 4; %3
Ki = 4.8; %2
Kd = 0; %0.4

% uinit = (-cvec(1)*cosd(thetainitdeg)-cvec(3)*thetainitdeg/180*pi-cvec(4))/cvec(2);
% integralinit = uinit-Kp*(thr-thetainitdeg);

x0 = [thd(1);th(1);data1(1,4)];

options = odeset('RelTol',1e-5,'AbsTol',1e-5);
%[tout,xout] = ode45(@(t,x) helicopter_PID(t,x,thr,cvec,Kp,Kd,Ki),[t0 tf],x0,options);
[tout,xout] = ode45(@(t,x) helicopter_manualInput(t,x,thr,cvec,uv,tuv),[t0 tf],x0,options);

xout(:,1:2) = xout(:,1:2);

figure

subplot(2,1,1)
plot(tout,xout(:,1),'b.-')
hold on
plot(tuv,thd,'r.-')
title('velocity')
legend('simulated with same u','data')
axis([0,tf,-500,500]);
grid on

subplot(2,1,2)
plot(tout,xout(:,2),'b.-')
hold on
plot(tuv,th,'r.-')
title('position')
legend('simulated with same u','data')
axis([0,tf,-60,60]);
grid on

% subplot(3,1,3)
% hold on, grid on
% plot(tout,-xout(:,2)*Kp,'r.-')
% plot(tout,xout(:,3)*Ki,'g.-')
% plot(tout,xout(:,1)*Kd,'b.-')
% plot(tout,-xout(:,2)*Kp+xout(:,3)*Ki+xout(:,1)*Kd,'k.-')
% plot(tuv,uv,'k.-')
% title('PID')
% legend('P','I','D','u')

