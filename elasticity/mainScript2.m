clc;clear;close all

q = linspace(0,10,100);
P = 10-q;

qmid = diff(q)/2+q(1:end-1);
Pmid = diff(P)/2+P(1:end-1);
Emid = (diff(q)./qmid)./(diff(P)./Pmid);
Emid(Emid<=-1) = -1;
subplot(1,2,1);
plot(q,P,'Color','b','Marker','.');
xlabel('quantity');
ylabel('price');
legend('Demand curve');

subplot(1,2,2);
plot(qmid,Emid,'Color','r','Marker','.');
xlabel('quantity');
ylabel('mid point elasticity');