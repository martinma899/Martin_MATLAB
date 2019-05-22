clc;clear

syms a
syms b
syms c
syms d
syms e
syms x
syms y
syms z
syms w

A = [1 1 1 1 1 0;
     x -y z -w 0 0;
     x^3 -y^3 z^3 -w^3 0 0;
     x^4 y^4 z^4 w^4 0 0]
   
reduced = rref(A)

a = reduced(1,5);
b = reduced(2,5);
c = reduced(3,5);
d = reduced(4,5);

syms ui11
syms ui01
syms ui12
syms ui02
syms ui

D2u = 2*(a*ui11+b*ui01+c*ui12+d*ui02+e*ui)/...
  (x^2*b+y^2*c+z^2*d+w^2*e)

















  