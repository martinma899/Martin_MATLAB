clc;clear

m = 113.398; % maximum weight allowed
g = 9.81; % gravitational acceleration
l = 0.1; % cylinder length is 20 cm fully extended

F = linspace(m*g,40*m*g,101); % choose cylinder force from 1mg to 5mg

vsquared = 2*l/m*(F-m*g);
v = sqrt(vsquared);
h = 0.5*vsquared/g;

figure(1)
plot(F/6,h,'k.-')
figure(2)
plot(F/6,v,'b.-')