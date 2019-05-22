clc;clear;close all

alpha = 0:1:10;

% calculation from avl
[num,~,~] = xlsread('avl_calculations.xlsx');
CLtotavl = num(:,2);
CDtotavl = num(:,3);
CLffavl = num(:,6);
CDffavl = num(:,7);

% calculations from usyd vortex lattice code
alphap = linspace(0,10,100);
CLusyd = 5.33*pi/180*alphap;
CDusyd = 0.0233*CLusyd.^2;

figure(1)

subplot(2,3,1);
hold on
plot(alpha,CLtotavl,'bo');
plot(alpha,CLtotavl,'b-');
plot(alpha,CDtotavl,'ro');
plot(alpha,CDtotavl,'r-');
xlabel('alpha');
legend('CLtotavl','','CDtotavl','');
title('CLtot and CDtot from AVL calculation')

subplot(2,3,2);
hold on
plot(alpha,CLffavl,'bo');
plot(alpha,CLffavl,'b-');
plot(alpha,CDffavl,'ro');
plot(alpha,CDffavl,'r-');
xlabel('alpha');
legend('CLffavl','','CDffavl','');
title('CLff and CDff from AVL calculation')

subplot(2,3,3)
hold on
plot(alpha,CLtotavl,'bo');
plot(alpha,CLtotavl,'b-');
plot(alpha,CDtotavl,'ro');
plot(alpha,CDtotavl,'r-');
plot(alpha,CLffavl,'color',[0.5 0.5 1],'marker','o');
plot(alpha,CLffavl,'color',[0.5 0.5 1]);
plot(alpha,CDffavl,'color',[1 0.5 0.5],'marker','o');
plot(alpha,CDffavl,'color',[1,0.5,0.5]);
xlabel('alpha');
legend('CLtotavl','','CDtotavl','','CLffavl','','CDffavl','');
title('Comparison between total and trefftz values')

subplot(2,3,4);
hold on
plot(CDtotavl,CLtotavl,'k-');
plot(CDtotavl,CLtotavl,'ko');
xlabel('CDtotavl');
ylabel('CLtotavl');
title('Drag Polar between CLtotavl and CDtotavl')

subplot(2,3,5);
hold on
plot(CDffavl,CLffavl,'k-');
plot(CDffavl,CLffavl,'ko');
xlabel('CDffavl');
ylabel('CLffavl');
title('Drag Polar between CLffavl and CDffavl')

subplot(2,3,6);
hold on
plot(CDtotavl,CLtotavl,'k-');
plot(CDtotavl,CLtotavl,'ko');
plot(CDffavl,CLffavl,'color',[0.5 0.5 0.5],'marker','none');
plot(CDffavl,CLffavl,'color',[0.5 0.5 0.5],'marker','o');
xlabel('CDtotavl and CDffavl');
ylabel('CLtotavl and CLffavl');
legend('total values','','trefftz values','')
title('Drag polar comparison between totall and trefftz values');

figure(2)

subplot(2,2,1)
hold on
plot(alphap,CLusyd,'c-');
plot(alphap,CDusyd,'m-');
xlabel('alpha');
legend('CLusyd','CDusyd');
title('CL and CD from USYD code calculation')

subplot(2,2,2)
hold on
plot(CDusyd,CLusyd,'color',[0.5 0.5 0.5]);
xlabel('CDusyd');
ylabel('CLusyd');
title('Drag Polar between CLusyd and CDusyd')

subplot(2,2,3)
hold on
plot(alpha,CLtotavl,'bo');
plot(alpha,CLtotavl,'b-');
plot(alpha,CDtotavl,'ro');
plot(alpha,CDtotavl,'r-');
plot(alphap,CLusyd,'c-');
plot(alphap,CDusyd,'m-');
xlabel('alpha');
legend('avl code CL','','avl code CD','','USYD code CL','USYD code CD')
title('Different Codes CL and CD comparison')

subplot(2,2,4)
hold on
plot(CDtotavl,CLtotavl,'k-');
plot(CDtotavl,CLtotavl,'ko');
plot(CDusyd,CLusyd,'color',[0.5 0.5 0.5]);
xlabel('CD')
ylabel('CL')
legend('avl','','USYD code')
title('Comparison between drag polars')








