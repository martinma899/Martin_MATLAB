clc;clear

l = 6;
P = 48000;
q0 = 8000;

F1 = l/2*q0
F2 = 3/4*l*1/2*q0

Rd = (1/4*F2+3/4*P)/0.5
V = F2+P-Rd
Ra = F1-V
Ma = Ra*l/2-F1*l/4

F4 = l*q0/6
V = P-Rd+F4
M = l/4*Rd-l/6*F4-l/2*P