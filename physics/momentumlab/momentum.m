clear

m = 0.564;
m1 = 0.055;
m2 = 0.105;
m3 = 0.155;

data1 = [];
data2 = [];
data3 = [];
%% Trial 1

data1 = [0,0;0.22,0.17;0.44,0.33;0.66,0.48;0.88,0.63;1.1 0.76];
force1 = [0.42;0.44;0.44;0.47;0.44];
intervals1 = diff(data1(:,1));
impulse1 = force1.*intervals1;
cumimpulse1 = cumsum(impulse1);

diffvel1 = diff(data1(:,2));

momentumchange1 = diffvel1.*m;

error1 = abs(impulse1-momentumchange1);

avg1 = mean(error1);
std1 = std(error1);
se1 = std1/sqrt(5);

everything1 = cell(10,5);

everything1(2:7,1:2) = num2cell(data1);
everything1(3:7,3) = num2cell(impulse1);
everything1(3:7,4) = num2cell(momentumchange1);
everything(3:7,5) = num2cell(error1);
everything{8,1} = avg1;
everything{9,1} = std1;
everything{10,1} = se1

%xlswrite('out1.xlsx',everything1)

%% trial 2

data2 = [0,0.13;0.1,0.27;0.2,0.42;0.3,0.55;0.4,0.69;0.5 0.82];
force2 = [0.7;0.69;0.68;0.7;0.68];
intervals2 = diff(data2(:,1));
impulse2 = force2.*intervals2;
cumimpulse2 = cumsum(impulse2);

diffvel2 = diff(data2(:,2));

momentumchange2 = diffvel2.*m;

error2 = abs(impulse2-momentumchange2);
error2rounded = round(error2,6);

avg2 = mean(error2);
std2 = std(error2);
se2 = std2/sqrt(5);

%% trial 3

data3 = [0,0.92;0.06,1.16;0.12,1.27;0.18,1.37;0.24,1.48;0.3 1.59]
force3 = [1.01;0.98;1.07;1.08;0.86];
intervals3 = diff(data3(:,1));
impulse3 = force3.*intervals3
cumimpulse3 = cumsum(impulse3);

diffvel3 = diff(data3(:,2));

momentumchange3 = diffvel3.*m

error3 = abs(impulse3-momentumchange3);
error3rounded = round(error3,6)



avg3 = mean(error3)
std3 = std(error3)
se3 = std3/sqrt(5)

avgall = mean([0.0198,0.008832,0.0129])
seall = std([0.0198,0.008832,0.0129])/sqrt(3)