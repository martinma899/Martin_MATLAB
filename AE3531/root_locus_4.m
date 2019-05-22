clc;clear

h = tf([1 6 10],[1 2 10])

rlocus(h)
axis equal
grid on

syms sigma w k

exp = expand((sigma+1i*w)^2+(2*(3*k+1))/(k+1)*(sigma+1i*w)+10)
exp = simplify(exp)