clc;clear

cd0 = 0.015;
k = 0.05;
cl0 = 0.02;
clalpha = 0.12;

alpha = 0:1:20;
cl = cl0+alpha*clalpha;
cd = cd0+k*cl.^2;
R1 = cl./(cd.^2);

fprintf('alpha(deg) CL(-) CD(-)   CL/CD^2(-)\n')
for i = 1:length(alpha)
fprintf('%2.0f         %1.2f  %1.4f  %1.4f\n',alpha(i),cl(i),cd(i),R1(i));
end

clR1max = sqrt(cd0/(3*k));
cdR1max = 4/3*cd0;
R1max = clR1max/cdR1max^2

rho = density(4000);
m = 33100;
s = 88.2;
g = 9.81;
c = 19.3e-6*g;

m1 = 31000;
mfuel = 4500;


mfuel = linspace(0,4500,101);
R = sqrt(2*g/(rho*s))*sqrt(R1max)*2/c*(sqrt(m1)-sqrt(m1-mfuel));

figure(1)
plot(mfuel,R/1000,'k.-');
hold off
grid on
title('Range of executive jet vs. mass of fuel burnt')
xlabel('fuel burnt (kg)')
ylabel('Range (km)')

mfuel = 4500;
E = clR1max/cdR1max*1/c*log(m1./(m1-mfuel))
Ehr = E/3600

E2 = sqrt(1/(4*k*cd0))/c*log(m1./(m1-mfuel))
E2hr = E2/3600

mfuel = linspace(0,4500,101);
E3hr = sqrt(1/(4*k*cd0))/c*log(m1./(m1-mfuel))/3600;

figure(2)
plot(mfuel,E3hr,'k.-');
hold off
grid on
title('Endurance of executive jet vs. mass of fuel burnt')
xlabel('fuel burnt (kg)')
ylabel('Endurance (h)')













