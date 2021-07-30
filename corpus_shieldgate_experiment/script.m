clc;clear;

exp_shield = [...
198.258
287.457
463.854
671.318
936.915
1232.578
1587.374
1971.236
2414.230
2858.225
3388.418
3920.612
4482.872
5103.264];

exp_level = [...
5
10
15
20
25
30
35
40
45
50
55
60
65
70];

P = polyfit(exp_level,exp_shield/150,2)


predict_shield = 150*(1+0.0075*(exp_level-1).^2);

close all
plot(exp_level,exp_shield,'b.-')
hold on
plot(exp_level,predict_shield,'r.-')
plot(exp_level,predict_shield-exp_shield,'r.-')
grid on

