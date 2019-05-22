clc
epsilonplot = linspace(0,0.03,100);
sigmaplot = 18000*epsilonplot./(1+300*epsilonplot);
plot(epsilonplot,sigmaplot)

l = 48;
d = 0.125;
P = 0.6;
A = pi/4*d^2
sigma = P/A
epsilon = sigma/(18000-300*sigma)
deltal = epsilon*l
E = 18000
b = sigma-E*epsilon
epsilonp = -b/E
lp = l+l*epsilonp
epsilone = epsilon - epsilonp