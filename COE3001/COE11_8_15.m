clc;clear

Px = 1.5e3;
E = 30e6;
A1 = 1;
A2 = 2;
a = 24;
l = 2*a;

deltax = Px*l/E*(1/A1+1/A2)
deltay = Px*l/E*(-1/(A1*sqrt(3))+1/(A2*sqrt(3)))