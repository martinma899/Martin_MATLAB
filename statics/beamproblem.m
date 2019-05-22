q = 1;
M = 12;
solvedmat = rref([1 1 4;0 8+8 -8-12]);
Ra = solvedmat(1,end);
Rb = solvedmat(2,end);
res = 1000;
x1 = linspace(0,4,res);
v1 = -q*x1;
m1 = q*x1.*x1/2+x1.*v1;
x2 = linspace(4,12,res);
v2 = (Ra-q*4)*ones(1,res);
m2 = (x2-2).*v2-2*Ra;
x3 = linspace(12,20,res);
v3 = (Ra-q*4)*ones(1,res);
m3 = (x3-2).*v3-2*Ra-12;
subplot(2,1,1);
plot([x1 x2 x3],[v1,v2,v3],'r-');
hold on
plot([x1 x2 x3],zeros(1,length([x1 x2 x3])),'k--');
hold off
title('shear force');
subplot(2,1,2);
plot([x1 x2 x3],[m1,m2,m3],'b-');
hold on
plot([x1 x2 x3],zeros(1,length([x1 x2 x3])),'k--');
hold off
title('bending moment');
