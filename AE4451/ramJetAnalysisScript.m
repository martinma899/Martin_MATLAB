clc;clear

R = 287
r = 1.4
r2 = 1.3
Cp = R/(1-1/r)
Cp2 = R/(1-1/r2)

M = 2
Ta = 205
Pa = 11.6e3
Pe = Pa

T04 = 3000

rd = 1-0.1*(M-1)^1.5
rc = 0.97*0.95
rn = 1
itab = 0.98
itan = 0.95

Qr = 45000e3
mdota = 1
Ae = 0