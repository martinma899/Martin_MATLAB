clc;clear
E = 29000;
alpha = 6.5e-6;
deltat = 20;
l = 120;
epsilonthermo = alpha*deltat
deltalthermo = epsilonthermo*l
lactual = l*(1+epsilonthermo)
epsiloncompress = -1*deltalthermo/lactual
sigmacompress = epsiloncompress*E