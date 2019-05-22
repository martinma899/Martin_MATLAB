clc;clear

M = 3;
r = 1.4;
P = 1;

theta1 = 5;
M1 = prandtlmeyer(M,theta1,r,2,5)
P0free = P*pratio(M,r)
P1 = P0free/pratio(M1,r)


theta2 = 20;
M2 = prandtlmeyer(M1,theta2,r,2,5)
P2 = P0free/pratio(M2,r)

theta3 = 25;
[beta1,beta2] = shockangle(M,theta3,r,25,60,90);
beta = beta1
Mn = M*sind(beta)
P3 = P*npratio(Mn,r)
M3n = nshockM2(Mn,r)
M3 = M3n/sind(beta-theta3)
P03 = P0free*np0ratio(Mn,r)

theta4 = 20;
M4 = prandtlmeyer(M3,theta4,r,1,4)
P4 = P03/pratio(M4,r)

cl = (-P1*cosd(5)-P2*cosd(25)+P3*cosd(25)+P4*cosd(5))/(r/2*P*M^2*2*cosd(10))
cl = (-P1*sind(5)-P2*sind(25)+P3*sind(25)+P4*sind(5))/(r/2*P*M^2*2*cosd(10))