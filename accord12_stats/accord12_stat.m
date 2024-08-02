clc;clear;close all

% gear ratios
gear(1) = 2.651; 
gear(2) = 1.613;
gear(3) = 1.081; 
gear(4) = 0.772; 
gear(5) = 0.566; 
gearf = 4.437; 
wd = 25.86 ; % wheel diameter, in
W = 4431-850; % weight, lb

% load engine stat
load('k24z3');

% generate speed vector
v = linspace(0,145,146)'; 

% generate table for recording data
Tgears = table(); 
Tgears.v_mph = v; 

% open figures
f1 = figure;hold on;grid on;axis square;
f2 = figure;hold on;grid on;axis square;

% iterate through every gear
for i = 1:5
  rpmt = v*63360/(wd*pi)/60*gearf*gear(i); % calculate engine rpm vector from speed vector
  temp = rpmt<1000|rpmt>7500;
  rpmt(temp) = nan; % take out entries outside of rev range
  vt = v; vt(temp) = nan; % make new speed vector for plotting
  torque = interp1(k24z3.rpm,k24z3.torque,rpmt,'pchip'); % interpolate torque
  hp = interp1(k24z3.rpm,k24z3.hp,rpmt,'pchip'); % interpolate horsepower
  T = torque/(wd/2/12)*gearf*gear(i); % calculate thrust in lb
  a = T/W; % acceleration, g
  plot3(f1.CurrentAxes,vt,rpmt,a,'.-'); % plot
  plot3(f2.CurrentAxes,vt,rpmt,hp,'.-'); % plot
  % record data in table
  temp = sprintf('Tgears.rpm_%d=rpmt',i); eval(temp); % record rpm
  temp = sprintf('Tgears.hp_%d=hp',i); eval(temp); % record hp
  temp = sprintf('Tgears.torque_lbft%d=torque',i);eval(temp); % record torque
  temp = sprintf('Tgears.thrust_lb%d=T',i); eval(temp); % record thrust
  temp = sprintf('Tgears.accel_g%d=a',i); eval(temp); % record acceleration
end

legend(f1.CurrentAxes,'gear 1','gear 2','gear 3','gear 4','gear 5')
xlabel(f1.CurrentAxes,'speed/mph')
ylabel(f1.CurrentAxes,'rpm')
zlabel(f1.CurrentAxes,'acceleration/g')

legend(f2.CurrentAxes,'gear 1','gear 2','gear 3','gear 4','gear 5')
xlabel(f2.CurrentAxes,'speed/mph')
ylabel(f2.CurrentAxes,'rpm')
zlabel(f2.CurrentAxes,'power/hp')

% calculate g differences for any shift
% create shift data tables
shift_table = table();
% create a shift map of shift speeds
shift_table.v_mph = [10 19 27.5 42]'; % mph, 1.3v throttle
% shift_table.v_mph = [21 41 59 114]'; % mph, 2.5v throttle
% shift_table.v_mph = [42 74 108 130]'; % mph, 4.5v throttle
% shift_table.v_mph = [15 19 27.5 42]'; % mph


% create the rest of the table entries
shift_table.shift_rpm1 = zeros(4,1);
shift_table.shift_rpm2 = zeros(4,1);
shift_table.shift_torque1_lbft = zeros(4,1);
shift_table.shift_torque2_lbft = zeros(4,1);
shift_table.shift_torquediff_lbft = zeros(4,1);
shift_table.shift_accel1_g = zeros(4,1);
shift_table.shift_accel2_g = zeros(4,1);
shift_table.shift_acceldiff_g = zeros(4,1);

% iterate through every shift
for i = 1:4
  % shift rpms
  fn = sprintf('rpm_%d',i);shift_table.shift_rpm1(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip');
  fn = sprintf('rpm_%d',i+1);shift_table.shift_rpm2(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip'); 
  % shift torques
  fn = sprintf('torque_lbft%d',i);shift_table.shift_torque1_lbft(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip');
  fn = sprintf('torque_lbft%d',i+1);shift_table.shift_torque2_lbft(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip'); 
  % shift accelerations
  fn = sprintf('accel_g%d',i);shift_table.shift_accel1_g(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip');
  fn = sprintf('accel_g%d',i+1);shift_table.shift_accel2_g(i) = interp1(Tgears.v_mph,Tgears.(fn),shift_table.v_mph(i),'pchip'); 
  % plot the shift on accel map
  plot3(f1.CurrentAxes,...
    [shift_table.v_mph(i) shift_table.v_mph(i)],...
    [shift_table.shift_rpm1(i) shift_table.shift_rpm2(i)],...
    [shift_table.shift_accel1_g(i) shift_table.shift_accel2_g(i)],'rd-')
end

shift_table.shift_torquediff_lbft = shift_table.shift_torque1_lbft-shift_table.shift_torque2_lbft;
shift_table.shift_acceldiff_g = shift_table.shift_accel1_g-shift_table.shift_accel2_g;

disp(shift_table)

% calculate 1-2 shift difference in accel 
