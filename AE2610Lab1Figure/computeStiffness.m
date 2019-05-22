clc;clear;fclose('all');close all

data3 = dlmread(...
  'Figure 2 - engineering stress and extensometer strain microstrain.csv'...
  ,',',1,0);

data3 = data3(:,[2 1]);

%plot(data3(:,2),data3(:,1),'b.-');

data3_1 = data3(847:1349,:);
data3_2 = data3(1967:2380,:);

hold on
plot(data3_1(:,2),data3_1(:,1),'r.-');
plot(data3_2(:,2),data3_2(:,1),'b.-');

coeff1 = polyfit(data3_1(:,2),data3_1(:,1),1);
coeff2 = polyfit(data3_2(:,2),data3_2(:,1),1);
stiffness1 = coeff1(1)*1e6
stiffness2 = coeff2(1)*1e6

t1 = linspace(min(data3_1(:,2)),max(data3_1(:,2)),101);
y1 = polyval(coeff1,t1);
t2 = linspace(min(data3_2(:,2)),max(data3_2(:,2)),101);
y2 = polyval(coeff2,t2);

plot(t1,y1,'r-')
plot(t2,y2,'b-')

% bullshit final length after fracture: 2.2945