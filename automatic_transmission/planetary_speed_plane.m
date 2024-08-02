clc;clear;close all

% x = wr
% y = ws
% z = wc

r_n = 5;
rr = ones(1,r_n);
rs = linspace(0.1,0.9,r_n);
rc = (rr+rs)/2;
p_orth_arr = [rr;rs;-2*rc];
% zerorow = zeros(1,r_n);

res = 31;
axis_size = 3;
wr = linspace(-axis_size,axis_size,res);
ws = linspace(-axis_size,axis_size,res);
wc = linspace(-axis_size,axis_size,res);
zerolin = zeros(1,res);
[wr2,ws2] = meshgrid(wr,ws);

figure(1);hold on;axis equal;grid on;ax = gca;

cnt = 0; 
for cind = linspace(0,0.8,r_n)
  cnt = cnt+1;
  
  color_vec = color_func_full(cind,0.6,0.2);

  q = quiver3(ax,0,0,0,p_orth_arr(1,cnt),p_orth_arr(2,cnt),p_orth_arr(3,cnt));
  q.Color = color_vec;
  q.AutoScale = 'off';
  
  wc2 = (p_orth_arr(1,cnt)*wr2+p_orth_arr(2,cnt)*ws2)/-p_orth_arr(3,cnt);
  m = mesh(ax,wr2,ws2,wc2);
  m.FaceAlpha = 0;
  m.EdgeAlpha = 0.1;
  m.EdgeColor = color_vec;
  m.FaceColor = color_vec;
  
  
  wr_ws0 = -p_orth_arr(3,cnt)*wc/p_orth_arr(1,cnt);
  l = plot3(ax,wr_ws0,zerolin,wc);
  l.Color = color_vec;
  
  ws_wr0 = -p_orth_arr(3,cnt)*wc/p_orth_arr(2,cnt);
  l = plot3(ax,zerolin,ws_wr0,wc);
  l.Color = color_vec;
  l.LineStyle = '--';
  
  ws_wc0 = -p_orth_arr(1,cnt)*wr/p_orth_arr(2,cnt);
  l = plot3(ax,wr,ws_wc0,zerolin);
  l.Color = color_vec;
  l.LineStyle = '-.';
  
  text(axis_size,0,0,'ring')
  text(0,axis_size,0,'sun')
  text(0,0,axis_size,'carrier')
  
end



ax.XAxis.FirstCrossoverValue  = 0; % X crossover with Y axis
ax.XAxis.SecondCrossoverValue  = 0; % X crossover with Z axis
ax.YAxis.FirstCrossoverValue  = 0; % Y crossover with X axis
ax.YAxis.SecondCrossoverValue  = 0; % Y crossover with Z axis
ax.ZAxis.FirstCrossoverValue  = 0; % Z crossover with X axis
ax.ZAxis.SecondCrossoverValue = 0; % Z crossover with Y axis
ax.XAxis.Limits = [-axis_size axis_size];
ax.YAxis.Limits = [-axis_size axis_size];
ax.ZAxis.Limits = [-axis_size axis_size];
%  ax.ZAxis.Direction = 'reverse';


view(ax,135,35)