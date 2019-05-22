clc;clear

m0 = 1315;
mmaxfuel = 168;
s = 16.3;
cd0 = 0.026;
k = 0.054;
cl0 = 0.02;
clalpha = 0.12;
Pmax = 216e3;
g = 9.81;
cbar = 0.076e-6;
c = 0.076e-6.*g;
ita = 0.8;
n = 0.6;

CL_AEmax = sqrt(cd0./k);
CD_AEmax = 2.*cd0;
AEmax = CL_AEmax./CD_AEmax;
res = 101;

% climb
% variables: L, T, v, P, alpha, CL, CD, x, z, t, mvehicle, mfuelconsumed

mfuellast = 0;
mi = m0;

xi = 0;
xf = 35000;
zi = 0;
zf = 2000;

x1 = linspace(xi,xf,res);
z1 = linspace(zi,zf,res);
dzoverdx1 = z1./x1;
gamma1 = atan(dzoverdx1);
dzoverdx1(1) = dzoverdx1(2);
gamma1(1) = gamma1(2);
mfuelthis1 = mi.*(1-exp(-x1.*c./(ita.*cos(gamma1)).*(1./AEmax+dzoverdx1)));
mfuelthis1(isnan(mfuelthis1)) = 0;
m1 = mi-mfuelthis1;
mfueloverall1 = mfuelthis1+mfuellast; 

rho1 = density(z1);
CL1 = ones(1,res).*CL_AEmax;
CD1 = ones(1,res).*CD_AEmax;
v1 = sqrt(2.*m1.*g./(rho1.*s.*CL1));
T1 = 0.5.*rho1.*s.*v1.^2.*CD1+m1.*g.*dzoverdx1;
P1 = T1.*v1;
Pav1 = (rho1./density(0)).^n*Pmax*ita;
deltat1 = P1./Pav1;
alpha1 = (CL1-cl0)./(clalpha);
deltae1 = (0.24+0.18.*alpha1)./0.28;


%cruise
mfuellast = mfueloverall1(end);
mi = m1(end);

xi = 35000;
xf = 88000;
zi = 2000;
zf = 2000;

x2 = linspace(xi,xf,res);
R2 = x2-xi;
z2 = linspace(zi,zf,res);
dzoverdx2 = z2./x2;
gamma2 = atan(dzoverdx2);
dzoverdx2(1) = dzoverdx2(2);
gamma2(1) = gamma2(2);
mfuelthis2 = mi.*(1-exp(-R2.*c./(ita.*cos(gamma2)).*(1./AEmax+dzoverdx2)));
mfuelthis2(isnan(mfuelthis2)) = 0;
m2 = mi-mfuelthis2;
mfueloverall2 = mfuelthis2+mfuellast; 

rho2 = density(z2);
CL2 = ones(1,res).*CL_AEmax;
CD2 = ones(1,res).*CD_AEmax;
v2 = sqrt(2.*m2.*g./(rho2.*s.*CL2));
T2 = 0.5.*rho2.*s.*v2.^2.*CD2+m2.*g.*dzoverdx2;
P2 = T2.*v2;
Pav2 = (rho2./density(0)).^n*Pmax*ita;
deltat2 = P2./Pav2;
alpha2 = (CL2-cl0)./(clalpha);
deltae2 = (0.24+0.18.*alpha2)./0.28;

% descend
mfuellast = mfueloverall2(end);
mi = m2(end);

xi = 88000;
xf = 135000;
zi = 2000;
zf = 0;

x3 = linspace(xi,xf,res);
R3 = x3-xi;
z3 = linspace(zi,zf,res);
dzoverdx3 = z3./x3;
gamma3 = atan(dzoverdx3);
dzoverdx2(1) = dzoverdx2(2);
gamma2(1) = gamma2(2);
mfuelthis3 = mi.*(1-exp(-R3.*c./(ita.*cos(gamma3)).*(1./AEmax+dzoverdx3)));
mfuelthis3(isnan(mfuelthis3)) = 0;
m3 = mi-mfuelthis3;
mfueloverall3 = mfuelthis3+mfuellast; 

rho3 = density(z3);
CL3 = ones(1,res).*CL_AEmax;
CD3 = ones(1,res).*CD_AEmax;
v3 = sqrt(2.*m3.*g./(rho3.*s.*CL3));
T3 = 0.5.*rho3.*s.*v3.^2.*CD3+m3.*g.*dzoverdx3;
P3 = T3.*v3;
Pav3 = (rho3./density(0)).^n*Pmax*ita;
deltat3 = P3./Pav3;
alpha3 = (CL3-cl0)./(clalpha);
deltae3 = (0.24+0.18.*alpha3)./0.28;

% compute time
t1 = trapz(x1,1./(v1.*cos(gamma1)))/60
t2 = trapz(R2,1./(v2.*cos(gamma2)))/60
t3 = trapz(R3,1./(v3.*cos(gamma3)))/60
ttotalmin = (t1+t2+t3)

x = [x1 x2 x3];
z = [z1 z2 z3];
gamma = [gamma1 gamma2 gamma3];
mfuelthis = [mfuelthis1 mfuelthis2 mfuelthis3];
m = [m1 m2 m3];
mfueloverall = [mfueloverall1 mfueloverall2 mfueloverall3];
rho = [rho1 rho2 rho3];
CL = [CL1 CL2 CL3];
CD = [CD1 CD2 CD3];
v = [v1 v2 v3];
T = [T1 T2 T3];
P = [P1 P2 P3];
Pav = [Pav1 Pav2 Pav3];
deltat = [deltat1 deltat2 deltat3];
alpha = [alpha1 alpha2 alpha3];
deltae = [deltae1 deltae2 deltae3];



xkm = x./1000;

figure(1)

subplot(3,4,1);
hold on
plot(xkm,v,'k.-');
hold off
title('Airspeed')
ylabel('Airspeed (m/s)')
xlabel('x (km)')

subplot(3,4,2);
hold on
plot(xkm,CL,'k.-');
hold off
title('CL')
ylabel('CL (-)')
xlabel('x (km)')

subplot(3,4,3);
hold on
plot(xkm,m,'k.-');
hold off
title('Vehicle Mass')
ylabel('Vehicle Mass (kg)')
xlabel('x (km)')

subplot(3,4,11);
hold on
plot(xkm,deltat,'k.-');
hold off
title('Throttle Setting')
xlabel('x (km)')

subplot(3,4,4);
hold on
plot(xkm,z/1000,'k.-');
hold off
title('Altitude')
ylabel('Altitude (km)')
xlabel('x (km)')

subplot(3,4,5);
hold on
plot(xkm,P/1000,'k.-');
plot(xkm,Pav/1000,'r.-');
hold off
title('Power')
ylabel('Power (kw)')
legend('Power Required','Power Available')
xlabel('x (km)')

subplot(3,4,6);
hold on
plot(xkm,CD,'k.-');
hold off
title('CD')
ylabel('CD (-)')
xlabel('x (km)')

subplot(3,4,7);
hold on
plot(xkm,mfueloverall,'k.-');
hold off
title('Fuel Consumed')
ylabel('Fuel Consumed (kg)')
xlabel('x (km)')

subplot(3,4,12);
hold on
plot(xkm,deltae,'k.-');
hold off
title('Elevator Setting')
ylabel('Elevator Setting (^{\circ})')
xlabel('x (km)')

subplot(3,4,8);
hold on
plot(xkm,rho,'k.-');
hold off
title('Air Density')
ylabel('Air Density (kg/m^3)')
xlabel('x (km)')

subplot(3,4,9);
hold on
plot(xkm,T,'k.-');
hold off
title('Thrust')
ylabel('Thrust (N)')
xlabel('x (km)')

subplot(3,4,10);
hold on
plot(xkm,alpha,'k.-');
hold off
title('Angle of Attack')
ylabel('Angle of Attack (^{\circ})');
xlabel('x (km)')













