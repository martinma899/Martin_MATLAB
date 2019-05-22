clc;clear

syms w k

expr = expand(((1i*w)^2+2*1i*w+2)*((1i*w)^2+2*1i*w+5)+k)

imgpt = - w^3*4+ w*14;

wcross = double(solve(imgpt==0,w))
