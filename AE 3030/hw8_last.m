clc;clear

ymax = 0.02;
alfa = 5;
epsilon = atand(ymax/0.5);
Minf = 2;
r = 1.4;

M1 = prandtlmeyer(Minf,alfa-epsilon,1.4,2,3)
P1overPinf = pratio(Minf,r)/pratio(M1,r)

M2 = prandtlmeyer(M1,2*epsilon,1.4,2,3)
P2overPinf = pratio(Minf,r)/pratio(M2,r)

[beta] = shockangle (Minf,alfa+epsilon,r,0.1,45,89)
Minfn = Minf*sind(beta)
M3n = nshockM2(Minfn,r)
M3 = M3n/sind(beta-alfa-epsilon)
P3overPinf = npratio(Minfn,r)

M4 = prandtlmeyer(M3,2*epsilon,1.4,1,3)
P4overP3 = pratio(M3,r)/pratio(M4,r)
P4overPinf = P4overP3*P3overPinf

l = sqrt(0.02^2+0.5^2)

Cl = l/(r/2*Minf^2)*(P3overPinf*cosd(alfa+epsilon)...
                    +P4overPinf*cosd(alfa-epsilon)...
                    -P1overPinf*cosd(alfa-epsilon)...
                    -P2overPinf*cosd(alfa+epsilon))
Cd = l/(r/2*Minf^2)*(P3overPinf*sind(alfa+epsilon)...
                    +P4overPinf*sind(alfa-epsilon)...
                    -P1overPinf*sind(alfa-epsilon)...
                    -P2overPinf*sind(alfa+epsilon))

Cm = l^2/(r/2*Minf^2)*(-1/2*P3overPinf...
                     +1/2*P1overPinf...
                     -(1/2+cosd(2*epsilon))*P4overPinf...
                     +(1/2+cosd(2*epsilon))*P2overPinf)









