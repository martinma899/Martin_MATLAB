% lay out system parameters

if upper
m = Ju;
k = ku;
b = cu;
t0 = 0.655;
tf = 20;
x0 = -861;
else
m = Jl;
k = kl;
b = cl;
t0 = 0.514;
tf = 20;
x0 = 677;
end

% zeta = b/2/sqrt(k*m)


% step 1. produce simulated response

[tsim,xsim] = ode45(@(t,x) SMD(t,x,m,k,b),[t0 tf],[x0;0]);
xsim = xsim(:,1);
