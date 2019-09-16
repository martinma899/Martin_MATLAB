function [omega_d,omega_n,zeta] = analyzeData (data_in,num_periods,plot_bool)
% data_in is the time and position data of a S-M-D system. 
% num_periods is the number of first few periods the code looks at, since
% lower amplitude periods are more subject to nonlinear friction effects
% the algorithm first finds all the zeros and hence averages out a period
% and then finds omega_d
% Then the code looks at values one quarter period off the start of a
% period (interpolated), from the first to the last period accounted for.
% Then the code computes delta, zeta and omega_n based on formulas. 

% first step, zero finder. 
t = data_in(:,1); x = data_in(:,2);
[t0] = zero_finder(t,x);

% count zeros and make decisions
% if a half period is left hanging at the end, take it out
if mod(numel(t0),2) == 0
  t0(end) = [];
end

if ((numel(t0)-1)/2)>=num_periods
  t0 = t0(1:(num_periods*2+1));
else
  error('less complete periods are picked out from data than number of periods you want to look at.')
end

% estimate damped period
Td = 2*mean(diff(t0));
omega_d = 2*pi/Td;

% take a quarter period offset value of first and last period
t01 = t0(1)+0.25*Td;
t0m = t0(end-2)+0.25*Td;
x1 = interp1(t,x,t01,'spline');
xm = interp1(t,x,t0m,'spline');

% compute delta
delta = 1/num_periods*log(x1/xm);

% compute zeta and omega_n
zeta = delta/sqrt(4*pi^2+delta^2);
omega_n = delta/(zeta*Td);

% plot
if plot_bool
figure;hold on;grid on
plot(t,x,'b.-');
plot(t0,zeros(1,numel(t0)),'rd');
plot([t01 t0m],[x1 xm],'md');
end
end