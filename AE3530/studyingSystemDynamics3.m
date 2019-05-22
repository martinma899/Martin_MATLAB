clc;clear

m = 1;
b = 2.5;
k = 2;
x0 = 0.1;
v0 = 0.05;

num = [m*x0 m*v0+b*x0 0]
den = [m b k]

sys = tf(num,den)

step(sys)
grid on