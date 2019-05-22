clc;clear

M0=0;
u0=54;
Pmax = 152868;
Tmax = Pmax/u0;
dt0=0.75;
alfa0=5.6;
rho = 1.225;
Q = 0.5*rho*u0^2;
S = 184/(3.28084)^2;
b = 33.4/3.28084;
c = 5.7/3.28084;
W = 12232.61;
g = 9.81;
m = W/g;
Iy = 3000*(3.28084)^2*14.5939;


CL=0.41;
CD=0.05;
CLalfa=4.44;
CDalfa=0.33;
Cmalfa=-0.683;
CLalfad=0;
Cmalfad=-4.36;
CLq=3.8;
Cmq=-9.96;
CLM=0;
CDM=0;
CmM=0;
CLde=0.355;
Cmde = -0.923;

CLu = CLM*M0
CDu = CDM*M0
Cmu = CmM*M0
CTu = -CD
Xu = -(CDu+2*CD)*Q*S/(m*u0)
Zu = -(CLu+2*CL)*Q*S/(m*u0)
Xw = -(CDalfa-2*CL)*Q*S/(m*u0)
Zw = -(CLalfa+2*CD)*Q*S/(m*u0)
Mu = Cmu*Q*S*c/(u0*Iy)
Mw = Cmalfa*Q*S*c/(u0*Iy)
Mq = Cmq*c^2*Q*S/(2*u0*Iy)
Mwd = Cmalfad*c^2*Q*S/(2*u0^2*Iy)
Xdt = Tmax
Zde = CLde*Q*S/m
Mde = Cmde*Q*S*c/Iy

A = [Xu Xw 0 -g;Zu Zw u0 0;Mu+Mwd*Zu Mw+Mwd*Zw Mq+Mwd*u0 0;0 0 1 0]

B = [0 Xdt;Zde 0;Mde+Mwd*Zde 0;0 0]

sol1 = inv(A)*-B*[-0.02/180*pi;0]

dalfa = atand(sol1(2)/sol1(1))
dtheta = sol1(4)/pi*180































