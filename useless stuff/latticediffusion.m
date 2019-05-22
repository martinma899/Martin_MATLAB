t = linspace(0,5,1000);
C = [4 2 1 4];
A = [-1 1 0 0;1 -2 1 0;0 1 -2 1;0 0 1 -1];
[V,D] = eig(A);
x1 = C(1)*exp(D(1,1)*t)*V(1,1)+C(2)*exp(D(2,2)*t)*V(1,2)+...
     C(3)*exp(D(3,3)*t)*V(1,3)+C(4)*exp(D(4,4)*t)*V(1,4);
x2 = C(1)*exp(D(1,1)*t)*V(2,1)+C(2)*exp(D(2,2)*t)*V(2,2)+...
     C(3)*exp(D(3,3)*t)*V(2,3)+C(4)*exp(D(4,4)*t)*V(2,4);
x3 = C(1)*exp(D(1,1)*t)*V(3,1)+C(2)*exp(D(2,2)*t)*V(3,2)+...
     C(3)*exp(D(3,3)*t)*V(3,3)+C(4)*exp(D(4,4)*t)*V(3,4);
x4 = C(1)*exp(D(1,1)*t)*V(4,1)+C(2)*exp(D(2,2)*t)*V(4,2)+...
     C(3)*exp(D(3,3)*t)*V(4,3)+C(4)*exp(D(4,4)*t)*V(4,4);
close all
hold on
plot(t,x1,t,x2,t,x3,t,x4);
legend('x1','x2','x3','x4')
plot(t,t*0+V(1,4)*C(4),'k')

%%

t = linspace(0,10,1000);
C = [4 2 1];
A = [-1 1 0;1 -2 1;0 1 -2];
[V,D] = eig(A);
x1 = C(1)*exp(D(1,1)*t)*V(1,1)+C(2)*exp(D(2,2)*t)*V(1,2)+...
     C(3)*exp(D(3,3)*t)*V(1,3);
x2 = C(1)*exp(D(1,1)*t)*V(2,1)+C(2)*exp(D(2,2)*t)*V(2,2)+...
     C(3)*exp(D(3,3)*t)*V(2,3);
x3 = C(1)*exp(D(1,1)*t)*V(3,1)+C(2)*exp(D(2,2)*t)*V(3,2)+...
     C(3)*exp(D(3,3)*t)*V(3,3);
close all
hold on
plot(t,x1,t,x2,t,x3);
legend('x1','x2','x3')
plot(t,t*0,'k')