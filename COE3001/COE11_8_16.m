clc;clear

E = 200e9;
A1 = 800e-6;
A2 = 1600e-6;
W = 10e3;
l1 = 1.2;
l2 = sqrt(1.2^2+1.8^2);
alpha = atand(2/3)

deltay = 4/9*W*l1/(E*A1)+W*l2/(E*A2*cosd(alpha)^2)
deltax = -2/3*W*l1/(E*A1)