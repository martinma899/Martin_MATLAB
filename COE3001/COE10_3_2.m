clc;clear
P = 12000;
l = 4;
E = 11e9;
delta = -2e-3;
mat = [l^3/3 -l^2/2 5*P*l^3/48;l^2/2 -l P*l^2/8]
rref(mat)
R1 = 6000;
M1 = 6000;
R2 = 6000;
M2 = 6000;

x = l/2
if x <= l/2
insideeq = R1/6*(x)^3-M1/2*(x)^2-P/6*(x-l/2)^3
else
insideeq = R1/6*(x)^3-M1/2*(x)^2
end

I = insideeq/(E*delta)
h = (I*24)^(1/4)

xinf = (-M1+P*l/2)/(P-R1)
x = xinf
if x > l/2
v = (R1/6*(x)^3-M1/2*(x)^2-P/6*(x-l/2)^3)/(E*I)
else
insideeq = (R1/6*(x)^3-M1/2*(x)^2)/(E*I)
end