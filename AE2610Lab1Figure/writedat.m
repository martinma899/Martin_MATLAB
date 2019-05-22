clc;clear;close all;fclose('all');

[~,~,dat] = xlsread('B3_Tensile_StrainGauge.xls');


dat = dat(9:end,2:end);
dat = cell2mat(dat);

% hold on
% plot(dat(:,1),dat(:,2),'r-')
% plot(dat(:,1),dat(:,3),'g-')
% plot(dat(:,1),dat(:,4),'b-')

dat = dat(:,[1 3]);
dat(:,2) = dat(:,2)*1e-6*100;
dat = dat(1:448,:);

% plot(dat(:,1),dat(:,2))

[~,~,dat2] = xlsread('tensile.xlsx');
dat2 = cell2mat(dat2(3:end,[1 4]));

t1 = dat(:,1);
t2 = dat2(:,1);
stress2 = dat2(:,2);

stress1interp = interp1(t2,stress2,t1-73.9,'cubic');

plot(dat(:,2),stress1interp)

xlswrite('tensile_gauge_interpolated.xlsx',[stress1interp,dat(:,2)]);














