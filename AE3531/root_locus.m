clc;clear

h = tf([1],[1 5 9 5 0])

rlocus(h)
axis equal

alpha1 = pi-(angle(-2+1i--1)+angle(-2+1i)+angle(-2+1i-(-2-1i)))
alpha1 = alpha1/pi*180
alpha1 = alpha1+360

syms omega

sol = solve(-5*omega^3+5*omega==0,omega)

sol = sol([1 3]);

k = -sol.^4+9*sol.^2