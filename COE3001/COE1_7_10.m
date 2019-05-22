clc;clear
d = 80e-3;
l = 5;
E = 110e9;
v = 0.33;
P = 1400e3;

%problem 1
A = pi/4*d^2
N = P
delta = N*l/(E*A)
df = d*(1-delta/l*v)
lf = l+delta
deltaV = pi/4*(df^2*lf-d^2*l)

%problem 2 
d1 = [2*d d 2*d]'
l1 = [2/5*l l/5 2/5*l]'
A1 = pi/4*d1.^2
N1 = P
delta1 = N1*l1./(E*A1)
df1 = d1.*(1-delta1./l1*v)
lf1 = l1+delta1
deltaV1 = pi/4*(df1.^2.*lf1-d1.^2.*l1)

%problem 3
d1 = [2*d d 2*d]'
l1 = [7/15*l l/5 7/15*l]'
A1 = pi/4*d1.^2
N1 = [P P P]'
delta1 = N1.*l1./(E*A1)
df1 = d1.*(1-delta1./l1*v)
lf1 = l1+delta1
deltaV1 = pi/4*(df1.^2.*lf1-d1.^2.*l1)
infodisp = [d1 l1 A1 N1 delta1 df1 lf1 deltaV1]'