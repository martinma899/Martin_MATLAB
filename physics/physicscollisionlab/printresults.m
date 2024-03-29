clc

mlcart = 0.4982+0.4974;
mrcart = 0.491;

firstset = [0.29 0 0.042 0.09 0.39 0.0414 0.00049 0.0117];

expercteddeltak = 1-(mlcart^2+mrcart*mlcart)/((mlcart+mrcart)^2);

data1 = [-0.0230 0.339 0.09 2 0.39 1.98]; % good one
data2 = [-0.00462 0.491 0.16 1.16 0.64 1.14]; % good one
data3 = [-0.035 0.227 0.06 1.08 0.24 1.06]; % good one
data4 = [-0.0244 0.301 0.07 2.96 0.28 2.94]; % okay one
data5 = [-0.0374 0.479 0.14 1.72 0.56 1.7]; % okay one
data6 = [-0.0272 0.509 0.15 2.96 0.56 2.98];

data7 = [-0.0171 0.448 0.27 1.36 0.27 1.36];
data8 = [-0.0349 0.429 0.25 1.74 0.25 1.74];
data9 = [-0.0447 0.538 0.31 1.38 0.31 1.38];
data10= [-0.0345 0.505 0.31 1.46 0.31 1.46];
data11= [-0.0292 0.41 0.26 1.46 0.26 1.46];
data12= [-0.0231 0.339 0.2 2.3 0.2 2.3];

% slope = data(1);
% intercept = data(2);
% leftv = data(3);
% leftt = data(4);
% rightv = data(5);
% rightt = data(6);

[result1] = crankoutdata(data1,mlcart,mrcart);
[result2] = crankoutdata(data2,mlcart,mrcart);
[result3] = crankoutdata(data3,mlcart,mrcart);
[result4] = crankoutdata(data4,mlcart,mrcart);
[result5] = crankoutdata(data5,mlcart,mrcart);
[result6] = crankoutdata(data6,mlcart,mrcart);

[result7] = crankoutdata(data7,mlcart,mrcart);
[result8] = crankoutdata(data8,mlcart,mrcart);
[result9] = crankoutdata(data9,mlcart,mrcart);
[result10] = crankoutdata(data10,mlcart,mrcart);
[result11] = crankoutdata(data11,mlcart,mrcart);
[result12] = crankoutdata(data12,mlcart,mrcart);

arr1 = [result1';result2';result3';result4';result5';result6'];
mean1 = mean(arr1(:,end));
std1 = std(arr1(:,end));
se1 = std1/sqrt(6);

arr2 = [result7';result8';result9';result10';result11';result12'];
mean2 = mean(arr2(:,end));
std2 = std(arr2(:,end));
se2 = std2/sqrt(6);

% [a b] = size(arr2);
% long = a*b;
% thing = arr2';
% for i = 47:long
%     disp(round(thing(i),4));
%     disp(' ');
%     pause(3.4);
% end