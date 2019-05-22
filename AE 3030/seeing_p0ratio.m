clc;clear;close all
hold on

r = 1.4;
M1 = linspace(0,3,100);

% M2 = [];
% for i = 1:numel(M1)
%   M2 = [M2 nshockM2(M1(i),r)];
% end
% plot(M1,M2,'m')
% 
% p0ratio = [];
% for i = 1:numel(M1)
%   p0ratio = [p0ratio np0ratio(M1(i),r)];
% end
% plot(M1,p0ratio,'g')

rhoratiovar = [];
for i = 1:numel(M1)
  rhoratiovar = [rhoratiovar rhoratio(M1(i),r)];
end
plot(M1,rhoratiovar,'r')

pratiovar = [];
for i = 1:numel(M1)
  pratiovar = [pratiovar pratio(M1(i),r)];
end
plot(M1,pratiovar,'g')

tratiovar = [];
for i = 1:numel(M1)
  tratiovar = [tratiovar tratio(M1(i),r)];
end
plot(M1,tratiovar,'b')

plot([0.3 0.3],[0 1],'k')







