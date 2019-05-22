A1 = 2.5;
A2 = 3;
tend = 7;
options = odeset('RelTol',1e-5,'AbsTol',1e-5);
[t1,y1] = ode45(@fun1,[0 tend],[0 A1],options);
[t2,y2] = ode45(@fun1,[0 tend],[0 A2],options);
close all
hold on
plot(t1,y1(:,1),'b-');
plot(t1,y1(:,1),'b.');
plot(t2,y2(:,1),'r-');
plot(t2,y2(:,1),'r.');
legend('A = 2.5','','A = 3','');
xlabel('t')
ylabel('y')
title('solution for large A')