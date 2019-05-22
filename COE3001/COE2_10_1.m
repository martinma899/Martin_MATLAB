clc;clear

P = 3000;
t = 0.25;
b = 6;

A = b*t
sigmauniform = P/A

K1 = 0.16539033/0.2+1.5
sigmamax1 = sigmauniform*K1

K2 = 0.21532972/0.2+1.5
sigmamax2 = sigmauniform*K2

c = 2.5;
b = 4;

sigmanorm = P/(c*t)

K3 = 0.08046159/0.1+1.5
sigmamax3 = sigmanorm*K3

K4 = 0.03800695/0.1+1.5
sigmamax4 = sigmanorm*K4