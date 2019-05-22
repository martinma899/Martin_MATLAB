clc;clear;close all

A = [1 0 0 0;0 1 0 0;1 1 1 1;0 1 2 3];

C = inv(A)'

xa = 0;
xb = 1;
he = xb-xa;

x = linspace(xa,xb,101);

xalt = 1/he*(x-xa);

phiarr = C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3];

hold on
plot(x,phiarr(1,:));
plot(x,phiarr(2,:));
plot(x,phiarr(3,:));
plot(x,phiarr(4,:));

legend('phi1','phi2','phi3','phi4')

syms x xa xb he xalt phiarr

% he = xb-xa;

xalt = 1/he*(x-xa);

phiarr = simplify(C*[xalt.^0;xalt.^1;xalt.^2;xalt.^3])

