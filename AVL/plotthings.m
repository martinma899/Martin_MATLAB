clc;clear;close all
hold on

num = 1;
[alfa,cdarr,cdiarr,clarr] = loadvars (num);
figure(1);hold on
plot(clarr,cdiarr,'r.-');
figure(2);hold on
plot(clarr,cdarr,'r.-');
figure(3);hold on
plot(alfa,clarr,'r.-');

num = 2;
[alfa,cdarr,cdiarr,clarr] = loadvars (num);
figure(1);hold on
plot(clarr,cdiarr,'g.-');
figure(2);hold on
plot(clarr,cdarr,'g.-');
figure(3);hold on
plot(alfa,clarr,'g.-');

num = 3;
[alfa,cdarr,cdiarr,clarr] = loadvars (num);
figure(1);hold on
plot(clarr,cdiarr,'b.-');
figure(2);hold on
plot(clarr,cdarr,'b.-');
figure(3);hold on
plot(alfa,clarr,'b.-');

figure(1)
xlabel('CL')
ylabel('CDi')
legend('Wing-1','Wing-2','Wing-3')
title('Drag polar for three wings, CDi = induced drag')
grid on

figure(2)
xlabel('CL')
ylabel('CD')
legend('Wing-1','Wing-2','Wing-3')
title('Drag polar for three wings, CD = CDi+CDv')
grid on

figure(3)
xlabel('alfa')
ylabel('CL')
legend('Wing-1','Wing-2','Wing-3')
title('CL vs alfa')
grid on