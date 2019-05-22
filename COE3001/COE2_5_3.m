clc;clear

W = 750;
d = 0.125;
alphas = 6.5e-6;
alphaa = 12e-6;
Es = 30e6;

deltaT = W/(Es*pi/2*d^2*(alphaa-alphas))