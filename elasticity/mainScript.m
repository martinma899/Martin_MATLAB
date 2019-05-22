clc;clear;close all

E = -10; % inelastic good, demand curve
C = 1;
q = linspace(0,100,100);
P = C*q.^(1/E);
P(P>=10*median(P)) = 10*median(P);

plot(q,P,'Color','b','Marker','.');
xlabel('quantity');
ylabel('price');
legend('Demand curve');
titleStr = sprintf(...
'Constant elasticity demand curve with E = %1.4f and C = %1.4f%',...
  E,C);
title(titleStr);