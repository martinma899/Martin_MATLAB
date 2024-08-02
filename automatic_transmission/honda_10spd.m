clc;clear;close all

% r1 = 5.246
% r2 = 3.271
% r3 = 2.185
% r4 = 1.597
% r5 = 1.304
% r6 = 1.000
% r7 = 0.782
% r8 = 0.653
% r9 = 0.581
% r10 = 0.517
% rr = 3.974

% wheel size (in)
Dwheel = 18+235/25.4*0.6*2;
% 1rpm / 1mph
rpm_mph = 63360/(60*pi*Dwheel); 
% final drive ratio
rf = 3.550;

rr_rs2 = 98/52; % from counting gear teeth
rs_rr2 = 1/rr_rs2;
rs_rc2 = 2/(1+rr_rs2);
rc_rs2 = 1/rs_rc2;
rr_rc2 = 2-rs_rc2;
rc_rr2 = 1/rr_rc2;

r4 = 1.597;
rr_rc1 = (1/r4+rs_rr2)/rc_rr2;
rs_rc1 = 2-rr_rc1;
rc_rr1 = 1/rr_rc1;
rc_rs1 = 1/rs_rc1;
rs_rr1 = rs_rc1*rc_rr1;
rr_rs1 = 1/rs_rr1;

r1 = 5.246;
rs_rr3 = 1/r1/rs_rr2;
rr_rs3 = 1/rs_rr3;
rs_rc3 = 2/(1+rr_rs3);
rc_rs3 = 1/rs_rc3;
rr_rc3 = 2-rs_rc3;
rc_rr3 = 1/rr_rc3;

rr = 3.974;
rr_rc4 = ((1/rr*rr_rs2)+rs_rr3)*rr_rc3;
rc_rr4 = 1/rr_rc4;
rs_rc4 = 2-rr_rc4;
rc_rs4 = 1/rs_rc4;
rr_rs4 = rr_rc4*rc_rs4;
rs_rr4 = 1/rr_rs4;

% cols: input-c3, c1-c2, s2-r3, r4, r1-c3-c4, s1, s4, r2-output
% reverse gear
wc1c2r = 0; %TWC
ws4r = 0; % B2
wr4r = 1; % C3
wr1c3c4r = 1/2*rr_rc4; % gear set 4
ws2r3r = -rs_rr3*1+2*rc_rr3*wr1c3c4r; % gear set 3
wr2r = -rs_rr2*ws2r3r; % gear set 2
ws1r = -rr_rs1*wr1c3c4r; % gear set 1 (s1 idle)

% 1st gear
ws11 = 0; % B1
ws41 = 0; % B2
wc1c21 = 0; % TWC
wr1c3c41 = 0; % gear set 1
wr41 = 0; % gear set 4
ws2r31 = -rs_rr3; % gear set 3
wr21 = -rs_rr2*ws2r31; % gear set 2

% 2nd gear
ws12 = 0; % B1
ws42 = 0; % B2
ws2r32 = ws42; % C2
wr1c3c42 = 1/2*rs_rc3; % gear set 3
wc1c22 = wr1c3c42*1/2*rr_rc1; % gear set 1
wr22 = wc1c22*2*rc_rr2; % gear set 2
wr42 = wr1c3c42*2*rc_rr4; % gear set 4 (idle)

% 3rd gear
ws13 = 0; % B1
wr43 = 1; % C3
ws43 = 0; % B2
wr1c3c43 = 1/2*rr_rc4; % gear set 4
ws2r33 = -rs_rr3+2*rc_rr3*wr1c3c43; % gear set 3
wc1c23 = wr1c3c43*1/2*rr_rc1; % gear set 1
wr23 = wc1c23*2*rc_rr2+ws2r33*-rs_rr2; % gear set 2

% 4th gear
ws14 = 0; % B1
wr44 = 1; % C3
% C2lock gear set 3 4 two input two output solve
ws2r34 = (-rs_rr3-rc_rr3*rs_rr3/(rc_rs4-rc_rr3))*1+rc_rr3*rr_rs4/(rc_rs4-rc_rr3)*wr44;
ws44 = ws2r34; 
wr1c3c44 = -rs_rr3/(2*(rc_rs4-rc_rr3))*1+rr_rs4/(2*(rc_rs4-rc_rr3))*wr44;
wc1c24 = wr1c3c44*1/2*rr_rc1; % gear set 1
wr24 = wc1c24*2*rc_rr2+ws2r34*-rs_rr2; % gear set 2

% 5th gear
wc1c25 = 1; % C1
ws15 = 0; % B1
wr45 = 1; % C3
wr1c3c45 = 2*rc_rr1; % gear set 1
ws2r35 = -rs_rr3+2*rc_rr3*wr1c3c45; % gear set 3
wr25 = 2*rc_rr2+-rs_rr2*ws2r35; % gear set 2
ws45 = 2*rc_rs4*wr1c3c45-rr_rs4*wr45; % gear set 4 (idle)

% 6th gear
wc1c26 = 1; % C1
wr46 = 1; % C3
% C2lock gear set 3 4 two input two output solve
ws2r36 = 1; 
wr1c3c46 = 1; 
ws46 = 1; 
wr26 = 1; % gear set 2
ws16 = 1; % gear set 1

% 7th gear
wc1c27 = 1; % C1
wr47 = 1; % C3
ws47 = 0; % B2
wr1c3c47 = 1/2*rr_rc4; % gear set 4
ws2r37 = -rs_rr3+wr1c3c47*2*rc_rr3; % gear set 3
wr27 = -rs_rr2*ws2r37+2*rc_rr2*wc1c27; % gear set 2
ws17 = 2*rc_rs1*wc1c27-rr_rs1*wr1c3c47; % gear set 1 (idle)

% 8th gear
wc1c28 = 1; % C1
ws48 = 0; % B2
ws2r38 = 0; % C2
wr28 = 2*rc_rr2*wc1c28; % gear set 2
wr1c3c48 = 1/2*rs_rc3; % gear set 3 (idle)
ws18 = wr1c3c48*-rr_rs1+wc1c28*2*rc_rs1; % gear set 1 (idle)
wr48 = 2*rc_rr4*wr1c3c48; % gear set 4 (idle)

% 9th gear
wc1c29 = 1; % C1
ws49 = 0; % B2
wr49 = 0; % B3
wr1c3c49 = 0; % gear set 4
ws2r39 = -rs_rr3; % gear set 3
wr29 = 2*rc_rr2*wc1c29-rs_rr2*ws2r39; % gear set 2
ws19 = 2*rc_rs1*wc1c29; % gear set 1

% 10th gear
wc1c210 = 1; % C1
wr410 = 0; % B3
% C2lock gear set 3 4 two input two output solve
ws2r310 = (-rs_rr3-rc_rr3*rs_rr3/(rc_rs4-rc_rr3))*1+rc_rr3*rr_rs4/(rc_rs4-rc_rr3)*wr410;
ws410 = ws2r310; 
wr1c3c410 = -rs_rr3/(2*(rc_rs4-rc_rr3))*1+rr_rs4/(2*(rc_rs4-rc_rr3))*wr410;
wr210 =  ws2r310*-rs_rr2 + wc1c210*2*rc_rr2; % gear set 2
ws110 = wr1c3c410*-rr_rs1+wc1c210*2*rc_rs1; % gear set 1 (idle)

r2 = 1/(1/2*rs_rc3*1/2*rr_rc1*2*rc_rr2);

r3 = 1/(-rs_rr2*(-rs_rr3+rc_rr3*rr_rc4)+2*rc_rr2*(1/2*rr_rc4*1/2*rr_rc1));

r5 = 1/(-rs_rr2*(-rs_rr3+2*rc_rr3*2*rc_rr1)+2*rc_rr2);

r6 = 1;

r7 = 1/(-rs_rr2*(-rs_rr3+rc_rr3*rr_rc4)+2*rc_rr2);

r8 = 1/(2*rc_rr2);

r9 = 1/(rs_rr2*rs_rr3+2*rc_rr2);

augm = [-rr_rs3 2*rc_rs3 1; -rs_rr4 2*rc_rr4 0];
sol = rref(augm);
wr3s4 = sol(1,3);
r10 = 1/(wr3s4*-rs_rr2+2*rc_rr2);

wr3s4 = -rs_rr3-rc_rr3*rs_rr3/(rc_rs4-rc_rr3);
wc3c4 = rs_rr3/(-2*(rc_rs4-rc_rr3));

% gear ratio array
% cols: P1 P2 P3 P4
% rows: rr/rs rr/rc rc/rs rc/rr rs/rc rs/rr

gear_ratio_arr = ...
  [ rr_rs1 rr_rs2 rr_rs3 rr_rs4;
    rc_rs1 rc_rs2 rc_rs3 rc_rs4;
    rr_rc1 rr_rc2 rr_rc3 rr_rc4;
    rc_rr1 rc_rr2 rc_rr3 rc_rr4;
    rs_rc1 rs_rc2 rs_rc3 rs_rc4;
    rs_rr1 rs_rr2 rs_rr3 rs_rr4];

% speed ratio array, input = 1
% cols: input-c3, c1-c2, s2-r3, r4, r1-c3-c4, s1, s4, r2-output
% rows: R 1 - 10 gear
speed_ratio_arr_input1 = [1 wc1c2r ws2r3r wr4r wr1c3c4r ws1r ws4r wr2r;
                          1 wc1c21 ws2r31 wr41 wr1c3c41 ws11 ws41 wr21;
                          1 wc1c22 ws2r32 wr42 wr1c3c42 ws12 ws42 wr22;
                          1 wc1c23 ws2r33 wr43 wr1c3c43 ws13 ws43 wr23;
                          1 wc1c24 ws2r34 wr44 wr1c3c44 ws14 ws44 wr24;
                          1 wc1c25 ws2r35 wr45 wr1c3c45 ws15 ws45 wr25;
                          1 wc1c26 ws2r36 wr46 wr1c3c46 ws16 ws46 wr26;
                          1 wc1c27 ws2r37 wr47 wr1c3c47 ws17 ws47 wr27;
                          1 wc1c28 ws2r38 wr48 wr1c3c48 ws18 ws48 wr28;
                          1 wc1c29 ws2r39 wr49 wr1c3c49 ws19 ws49 wr29;
                          1 wc1c210 ws2r310 wr410 wr1c3c410 ws110 ws410 wr210];

shift_rpm = 2000; 
speed_rpm_before_shift = speed_ratio_arr_input1(2:end,:)*shift_rpm;
speed_rpm_before_shift_wheel = speed_rpm_before_shift(:,end)/rf;
speed_mph_before_shift = speed_rpm_before_shift_wheel/rpm_mph;

% 1st row is 2nd gear
speed_rpm_after_shift = speed_ratio_arr_input1(3:end,:);
for i = 2:10
  speed_rpm_after_shift(i-1,:) = ...
    speed_rpm_after_shift(i-1,:)*speed_rpm_before_shift(i-1,end)/speed_rpm_after_shift(i-1,end);
end
speed_rpm_after_shift;
speed_rpm_after_shift_wheel = speed_rpm_before_shift_wheel(1:end-1);
speed_mph_after_shift = speed_mph_before_shift(1:end-1);

combined_arr = [1 speed_rpm_before_shift(1,:) speed_mph_before_shift(1)];

for i = 2:10
  combined_arr = [combined_arr;...
    i speed_rpm_after_shift(i-1,:) speed_mph_after_shift(i-1);
  i speed_rpm_before_shift(i,:) speed_mph_before_shift(i);];
end

name_arr = {'gear','engine_rpm','wc1c2','ws2r3','wr4','wr1c3c4','ws1','ws4','wr2','speed(mph)'};
T = array2table(combined_arr,'VariableNames',name_arr)

figure(1);hold on; grid on; 
c = color_func_full(0,0,0); plot(T.gear,T.engine_rpm,'Color',c,'Marker','o','MarkerEdgeColor',c);
c = color_func_full(1/9,0,0); plot(T.gear,T.wc1c2,'Color',c,'Marker','^','MarkerEdgeColor',c);
c = color_func_full(2/9,0,0); plot(T.gear,T.ws2r3,'Color',c,'Marker','+','MarkerEdgeColor',c);
c = color_func_full(3/9,0,0); plot(T.gear,T.wr4,'Color',c,'Marker','*','MarkerEdgeColor',c);
c = color_func_full(4/9,0,0); plot(T.gear,T.wr1c3c4,'Color',c,'Marker','.','MarkerEdgeColor',c);
c = color_func_full(5/9,0,0); plot(T.gear,T.ws1,'Color',c,'Marker','x','MarkerEdgeColor',c);
c = color_func_full(6/9,0,0); plot(T.gear,T.ws4,'Color',c,'Marker','s','MarkerEdgeColor',c);
c = color_func_full(7/9,0,0); plot(T.gear,T.wr2,'Color',c,'Marker','d','MarkerEdgeColor',c);

legend({'engine rpm','wc1c2','ws2r3','wr4','wr1c3c4','ws1','ws4','wr2'})

res = 11;
axis_size = 3000;
wr = linspace(-axis_size,axis_size,res);
ws = linspace(-axis_size,axis_size,res);
wc = linspace(-axis_size,axis_size,res);
zerolin = zeros(1,res);
[wr2,ws2] = meshgrid(wr,ws);

wc12 = 1/2*rs_rc1*ws2+1/2*rr_rc1*wr2;
wc22 = 1/2*rs_rc2*ws2+1/2*rr_rc2*wr2;
wc32 = 1/2*rs_rc3*ws2+1/2*rr_rc3*wr2;
wc42 = 1/2*rs_rc4*ws2+1/2*rr_rc4*wr2;

figure(2);hold on; grid on; axis equal; ax = gca;

% colors
P1color = color_func_full(0,0,0.3);
P2color = color_func_full(1/4,0,0.3);
P3color = color_func_full(2/4,0,0.3); 
P4color = color_func_full(3/4,0,0.3);

% P1 gear set plane
m1 = mesh(wr2,ws2,wc12);
m1.FaceAlpha = 0;
m1.EdgeAlpha = 0.1;
m1.EdgeColor = P1color;
m1.FaceColor = P1color;
% P1 gear set lines
wr_ws01 = 2*rc_rr1*wc;
l1 = plot3(ax,wr_ws01,zerolin,wc);
l1.Color = P1color;
l1.LineStyle = '-';
ws_wr01 = 2*rc_rs1*wc;
l2 = plot3(ax,zerolin,ws_wr01,wc);
l2.Color = P1color;
l2.LineStyle = '--';
ws_wc01 = -rr_rs1*wr;
l3 = plot3(ax,wr,ws_wc01,zerolin);
l3.Color = P1color;
l3.LineStyle = '-.';

% P2 gear set plane
m2 = mesh(wr2,ws2,wc22);
m2.FaceAlpha = 0;
m2.EdgeAlpha = 0.1;
m2.EdgeColor = P2color;
m2.FaceColor = P2color;
% P2 gear set lines
wr_ws02 = 2*rc_rr2*wc;
l1 = plot3(ax,wr_ws02,zerolin,wc);
l1.Color = P2color;
l1.LineStyle = '-';
ws_wr02 = 2*rc_rs2*wc;
l2 = plot3(ax,zerolin,ws_wr02,wc);
l2.Color = P2color;
l2.LineStyle = '--';
ws_wc02 = -rr_rs2*wr;
l3 = plot3(ax,wr,ws_wc02,zerolin);
l3.Color = P2color;
l3.LineStyle = '-.';

% P3 gear set plane
m3 = mesh(wr2,ws2,wc32);
m3.FaceAlpha = 0;
m3.EdgeAlpha = 0.1;
m3.EdgeColor = P3color;
m3.FaceColor = P3color;
% P3 gear set lines
wr_ws03 = 2*rc_rr3*wc;
l1 = plot3(ax,wr_ws03,zerolin,wc);
l1.Color = P3color;
l1.LineStyle = '-';
ws_wr03 = 2*rc_rs3*wc;
l2 = plot3(ax,zerolin,ws_wr03,wc);
l2.Color = P3color;
l2.LineStyle = '--';
ws_wc03 = -rr_rs3*wr;
l3 = plot3(ax,wr,ws_wc03,zerolin);
l3.Color = P3color;
l3.LineStyle = '-.';

% P4 gear set plane
m4 = mesh(wr2,ws2,wc42);
m4.FaceAlpha = 0;
m4.EdgeAlpha = 0.1;
m4.EdgeColor = P4color;
m4.FaceColor = P4color;
% P4 gear set lines
wr_ws04 = 2*rc_rr4*wc;
l1 = plot3(ax,wr_ws04,zerolin,wc);
l1.Color = P4color;
l1.LineStyle = '-';
ws_wr04 = 2*rc_rs4*wc;
l2 = plot3(ax,zerolin,ws_wr04,wc);
l2.Color = P4color;
l2.LineStyle = '--';
ws_wc04 = -rr_rs4*wr;
l3 = plot3(ax,wr,ws_wc04,zerolin);
l3.Color = P4color;
l3.LineStyle = '-.';

% % 1st gear
% i = 1;
% % plot planetay speed triplets
% plot3(T.wr1c3c4(i),T.ws1(i),T.wc1c2(i),'Marker','o','MarkerEdgeColor',color_func_full(0,0,0.3));
% text(T.wr1c3c4(i),T.ws1(i),T.wc1c2(i),'P1')
% plot3(T.wr2(i),T.ws2r3(i),T.wc1c2(i),'Marker','o','MarkerEdgeColor',color_func_full(1/4,0,0.3));
% text(T.wr2(i),T.ws2r3(i),T.wc1c2(i),'P2')
% plot3(T.ws2r3(i),T.engine_rpm(i),T.wr1c3c4(i),'Marker','o','MarkerEdgeColor',color_func_full(2/4,0,0.3));
% text(T.ws2r3(i),T.engine_rpm(i),T.wr1c3c4(i),'P3')
% plot3(T.wr4(i),T.ws4(i),T.wr1c3c4(i),'Marker','o','MarkerEdgeColor',color_func_full(0,0,0.3));
% text(T.wr4(i),T.ws4(i),T.wr1c3c4(i),'P4')
% % plot input
% plot3([0 0],[0 T.engine_rpm(i)],[0 0],'Color',color_func_full(1/3,0,0),'LineWidth',3)
% plot3(0,T.engine_rpm(i),0,'Marker','d','MarkerEdgeColor',color_func_full(1/3,0,0))
% text(0,T.engine_rpm(i),0,'engine rpm')
% % plot output
% plot3([0 T.wr2(i)],[0 0],[0 0],'Color',color_func_full(0,0,0),'LineWidth',3)
% plot3(T.wr2(i),0,0,'Marker','d','MarkerEdgeColor',color_func_full(0,0,0))
% text(T.wr2(i),0,0,'output rpm')
% % plot s3+c2=r3
% plot3([0 T.ws2r3(i)],[T.engine_rpm(i) T.engine_rpm(i)],[0 0],'k--')
% % plot r3 to s2 coupling
% plot3([T.ws2r3(i) T.ws2r3(i) T.ws2r3(i) 0],[T.engine_rpm(i) T.engine_rpm(i) 0 T.ws2r3(i)],[T.wr1c3c4(i) 0 0 0],'k--')
% % plot s2+c2=r2
% plot3([0 T.wr2(i)],[T.ws2r3(i) T.ws2r3(i)],[0 0],'k--')

% 2nd gear
i = 3;
% plot planetay speed triplets
plot3(T.wr1c3c4(i),T.ws1(i),T.wc1c2(i),'Marker','o','MarkerEdgeColor',color_func_full(0,0,0.3));
text(T.wr1c3c4(i),T.ws1(i),T.wc1c2(i),'P1')
plot3(T.wr2(i),T.ws2r3(i),T.wc1c2(i),'Marker','o','MarkerEdgeColor',color_func_full(1/4,0,0.3));
text(T.wr2(i),T.ws2r3(i),T.wc1c2(i),'P2')
plot3(T.ws2r3(i),T.engine_rpm(i),T.wr1c3c4(i),'Marker','o','MarkerEdgeColor',color_func_full(2/4,0,0.3));
text(T.ws2r3(i),T.engine_rpm(i),T.wr1c3c4(i),'P3')
plot3(T.wr4(i),T.ws4(i),T.wr1c3c4(i),'Marker','o','MarkerEdgeColor',color_func_full(0,0,0.3));
text(T.wr4(i),T.ws4(i),T.wr1c3c4(i),'P4')
% plot input
plot3([0 0],[0 T.engine_rpm(i)],[0 0],'Color',color_func_full(1/3,0,0),'LineWidth',3)
plot3(0,T.engine_rpm(i),0,'Marker','d','MarkerEdgeColor',color_func_full(1/3,0,0))
text(0,T.engine_rpm(i),0,'engine rpm')
% plot output
plot3([0 T.wr2(i)],[0 0],[0 0],'Color',color_func_full(0,0,0),'LineWidth',3)
plot3(T.wr2(i),0,0,'Marker','d','MarkerEdgeColor',color_func_full(0,0,0))
text(T.wr2(i),0,0,'output rpm')
% plot s3+r3=c3
plot3([0,T.ws2r3(i),T.ws2r3(i)],[T.engine_rpm(i),T.engine_rpm(i),0],[0,0,0],'k--')
plot3([T.ws2r3(i),T.ws2r3(i)],[T.engine_rpm(i),T.engine_rpm(i)],[0,T.wr1c3c4(i)],'k--')

ax.XAxis.FirstCrossoverValue  = 0; % X crossover with Y axis
ax.XAxis.SecondCrossoverValue  = 0; % X crossover with Z axis
ax.YAxis.FirstCrossoverValue  = 0; % Y crossover with X axis
ax.YAxis.SecondCrossoverValue  = 0; % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue  = 0; % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0; % Z crossover with Y axis
ax.XAxis.Limits = [-axis_size axis_size];
ax.YAxis.Limits = [-axis_size axis_size];
ax.ZAxis.Limits = [-axis_size axis_size];
view(ax,135,35)
text(axis_size,0,0,'wr')
text(0,axis_size,0,'ws')
text(0,0,axis_size,'wc')
% legend('P1','P2','P3','P4')