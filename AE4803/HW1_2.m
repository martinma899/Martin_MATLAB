clc;clear

R = 287;
r = 1.4;

P = 5e4;
T = 260;
c = 150;
Rad = 0.33;
Mrel_max = 0.9;

disp('part a')
wmax = sqrt(r*R*T)*Mrel_max
umax = sqrt(wmax^2-c^2)
Phi_min = c/umax
omega_radpersec = umax/Rad
omega_RPM = omega_radpersec*30/pi
M_inlet = c/sqrt(r*R*T)
T0 = T*(1+(r-1)/2*M_inlet^2)
M_blade = umax/sqrt(r*R*T0)

disp('part b')

alpha1 = 20;
cz = cosd(alpha1)*c
u2 = sind(alpha1)*c
u1 = sqrt(wmax^2-cz^2)
umax = u1+u2
Phi_min = cz/umax
omega_radpersec = umax/Rad
omega_RPM = omega_radpersec*30/pi
M_blade = umax/sqrt(r*R*T0)

disp('part c')
Rad = 0.5
wmax = sqrt(r*R*T)*Mrel_max
umax = sqrt(wmax^2-c^2)
Phi_min = c/umax
omega_radpersec = umax/Rad
omega_RPM = omega_radpersec*30/pi
M_inlet = c/sqrt(r*R*T)
T0 = T*(1+(r-1)/2*M_inlet^2)
M_blade = umax/sqrt(r*R*T0)
