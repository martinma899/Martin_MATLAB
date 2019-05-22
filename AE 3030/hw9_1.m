clc;clear

vinf = 141*63360*0.0254/3600
mew = 1.7894e-5;
s = 9.75;
c = 1.6;
S = s*c
rho = 1.225

Rec = rho*vinf*c/mew
Cfl = 1.328/Rec^0.5
Dl = rho*vinf^2*S*Cfl

Cft = 0.074/Rec^0.2
Dt = rho*vinf^2*S*Cft

deltal = 5*c/Rec^0.5
deltat = 0.37*c/Rec^0.2