clc;clear;close all

x = linspace(-pi,pi,1001);

y = cos(2*x).^2;

sum = trapz(x,y)

plot(x,y,'b.-')
grid ON