clc;clear

syms s
den = expand(s*(s+0.5)*(s^2+0.6*s+10))
dden = diff(den,s)
sol = solve(den==0,s)
sol = double(sol)
bp = solve(-dden==0,s)
bp = double(bp)
sum(sol)/4

h = tf([1],[1 8 5 10 1])

rlocus(h)
axis equal
grid on
alpha1 = pi-(angle(sol(4)-sol(1))+angle(sol(4)-sol(2))+angle(sol(4)-sol(3)))
alpha1 = alpha1/pi*180

syms omega

bpomega = double(solve(-1.1*omega^3+5*omega==0,omega))

bpomega = bpomega([2 3]);

k = -bpomega.^4+10.3*bpomega.^2
