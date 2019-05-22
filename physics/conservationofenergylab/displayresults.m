clc

m = 0.8227;
f1 = 0.9;
f2 = 1.24;
f3 = 1.57;

data1 = [0 0;0.03 0.24; 0.08 0.39; 0.11 0.46; 0.17 0.58; 0.24 0.66];
data2 = [0 0;0.03 0.29;0.06 0.41;0.12 0.57;0.17 0.67;0.21 0.76];
data3 = [0 0;0.04 0.36;0.09 0.57;0.16 0.74;0.22 0.88;0.29 0.96];

[out1] = crankoutdata(data1,m,f1);
[out2] = crankoutdata(data2,m,f2);
[out3] = crankoutdata(data3,m,f3);

out1prime = round(out3',5);

clc

for i = 6:5*6
    disp(out1prime(i));
    disp(' ');
    pause(4.3);
end