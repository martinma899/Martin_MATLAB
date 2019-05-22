clc;clear;close all

minit = 1000;
Isp = 300;
g = 9.81;
e = 0.2;
a = 10000e3;
mew = 398600e9;
RE = 6378.137e3; % earth radius

% first, explore mprop vs. deltav

% Vp_init = sqrt(mew*(1+e)/(a*(1-e)))
% 
% Vtrasfer = sqrt(mew/(a*(1-e)))

deltaV1 = linspace(0,1000,101);
deltaV2 = deltaV1;
mprop1 = minit*(1-exp(-deltaV1/(g*Isp)));
mtransfer = minit-mprop1;
mprop2 = mtransfer.*(1-exp(-deltaV2/(g*Isp)));
mprop = mprop1+mprop2;

plot(deltaV1,mprop,'k.-')

grid on
xlabel('$$\Delta V \quad \bigg(\frac{m}{s}\bigg)$$','Interpreter','latex')
ylabel('$$m_{prop} \quad (kg)$$','Interpreter','latex')

deltaV1 = [673.716772257002 608.457293411451];
deltaV2 = deltaV1;
mprop1 = minit*(1-exp(-deltaV1/(g*Isp)));
mtransfer = minit-mprop1;
mprop2 = mtransfer.*(1-exp(-deltaV2/(g*Isp)));
mprop = mprop1+mprop2;

figure(1);hold on
plot(deltaV1(1),mprop(1),'rd')
plot(deltaV1(2),mprop(2),'bd')
title('\textbf{Mass of propellant required vs. $\Delta V$ in one of the two equal magnitude maneuvers}','Interpreter','latex')
text(700,mprop(1),'Option 1')
text(450,mprop(2),'Option 2')

% final problem
e = linspace(0,1,1001);
a = linspace(0,40000e3,1001);

[E,A] = meshgrid(e,a);

HP = A.*(1-E)-RE;

logicarr = HP<250e3;

deltaV1 = sqrt(mew./(A.*(1-E))).*(sqrt(1+E)-1);
deltaV2 = sqrt(mew./(A.*(1+E))).*(-sqrt(1-E)+1);
halfdeltaV3 = sqrt(mew./A).*sqrt(E.^2./(1-E.^2));

deltaV1(logicarr) = nan;
deltaV2(logicarr) = nan;
halfdeltaV3(logicarr) = nan;

figure(2);hold on
xlabel('e (-)')
ylabel('a (m)')
zlabel('deltaV (m/s)')
surf(E,A,deltaV1,'FaceColor','b','EdgeColor','none','FaceAlpha',0.5)
surf(E,A,deltaV2,'FaceColor','m','EdgeColor','none','FaceAlpha',0.5)
surf(E,A,halfdeltaV3,'FaceColor','g','EdgeColor','none','FaceAlpha',0.5)
grid on

