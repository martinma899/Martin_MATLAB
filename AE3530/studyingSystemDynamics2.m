clc;clear

m = 50;
k = 10;
num = [1];
den = [m 0 k];

sys = tf(num,den)

t = linspace(0,4,501);
u = t;

impulse(sys)
grid on
%lsim(sys,u,t)