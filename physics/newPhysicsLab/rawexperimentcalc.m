data1 = [1,0.89,-0.73;2,0.36,-0.32;2.86,0.24,0.03;3,0.25,0.07;3.5,0.33,0.26;4,0.51,0.44];
data2 = [1,0.67,-0.36;1.5,0.54,-0.15;1.88,0.51,0;2.5,0.59,0.24;2.8,0.68,0.35;3,0.75,0.42];
data3 = [1.2,0.95,-0.42;1.9,0.76,-0.13;2.22,0.74,0;2.6,0.76,0.14;3.1,0.87,0.32;3.6,1.08,0.5];

m1 = 0.487;
m2 = m1+0.4988;
m3 = m2+0.493;

[fulldata1,threeparams1] = processdata(data1,m1);
[fulldata2,threeparams2] = processdata(data2,m2);
[fulldata3,threeparams3] = processdata(data3,m3);

%xlswrite('out1.xlsx',fulldata1);