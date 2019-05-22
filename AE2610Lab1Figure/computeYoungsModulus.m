clc;clear;fclose('all');close all

data1 = dlmread('Figure 1 - engineering stress and extensometer microstrain.csv',',',1,0);
data2 = dlmread('Figure 1 - engineering stress and strain gauge micro strain.csv',',',1,0);
data3 = dlmread('Figure 2 - engineering stress and extensometer strain microstrain.csv',',',1,0);
data3 = data3(:,[2 1]);

hold on
plot(data1(:,2),data1(:,1));
plot(data2(:,2),data2(:,1));
plot(data3(:,2),data3(:,1));

% let's pick a linear region. 

numPts1 = 100;
numPts2 = 100;
numPts3 = 155;

data1(numPts1,:)
data2(numPts2,:)
data3(numPts3,:)

coeff1 = polyfit(data1(1:numPts1,2),data1(1:numPts1,1),1);
coeff2 = polyfit(data2(1:numPts2,2),data2(1:numPts2,1),1);
coeff3 = polyfit(data3(1:numPts3,2),data3(1:numPts3,1),1);
yongsModulus1 = coeff1(1)*1e6
yongsModulus2 = coeff2(1)*1e6
yongsModulus3 = coeff3(1)*1e6

% youngsModulus1 = zeros(1,353);
% youngsModulus2 = zeros(1,353);
% 
% for i = 2:353
%   sample1 = data1(1:i,:);
%   sample2 = data2(1:i,:);
%   coeff1 = polyfit(sample1(:,2),sample1(:,1),1);
%   coeff2 = polyfit(sample2(:,2),sample2(:,1),1);
%   yongsModulus1(i) = coeff1(1);
%   yongsModulus2(i) = coeff2(1);
% end
% 
% yongsModulus1(1) = [];
% yongsModulus2(1) = [];
% 
% figure(2)
% hold on
% plot(yongsModulus1,'r')
% plot(yongsModulus2,'b')




















