clc;clear

l = 6;
Ma = 24000;
P = 48000;
q0 = 8000;

F1 = l/2*q0
F2 = 3/4*l*1/2*q0

Rd = Ma/l+3/4*F2+5/4*P-1/4*F1
Ra = F1+Rd-F2-P

d = 7/60*l
F3 = 5*q0*l/24

V = F1-Ra-F3
M = (l/2+7/60*l)*F3+(l/2+l/4)*V+Ma-l/4*F1

F4 = l*q0/6
V = P-Rd+F4
M = l/4*Rd-l/6*F4-l/2*P