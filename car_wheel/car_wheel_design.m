clc;clear;close all

% OEM setup
Po = 225; % mm, tire width
ToverPo = 50; % percentage, tire aspect ratio
Do = 17; % in, rim diameter
Wo = 7.5; % in, rim width
Jo = 55; % mm, offset
So = 0; % mm, spacer width
colorRo = [1 0 0];
colorTo = [0 0 0];


% wheels: Rohana RC10
% tucks in fender
% P = 235; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 10; % in, rim width
% J = 30; % mm, offset
% S = 0; % mm, spacer width
% colorR = [1 0 0]*0.5;
% colorT = [1 1 1]*0.2;


Wo = Wo+1; % 1 inch total bead
To = Po*ToverPo/100; % tire height, mm
Do = Do*25.4; % R in mm
Wo = Wo*25.4; % W in mm

rim_x = [-Wo/2 Wo/2 Wo/2 -Wo/2 -Wo/2]-So+Jo; 
rim_y = [-Do/2 -Do/2 Do/2 Do/2 -Do/2];

tire_x = [-Po/2 Po/2 Po/2 -Po/2 -Po/2]-So+Jo; 
tire_y_u = [0 0 To To 0]+Do/2;
tire_y_l = [0 0 -To -To 0]-Do/2;

centerline_x = [0 0]-So+Jo;
centerline_y = [-Do/2 Do/2];

figure(1)
ax = gca; hold on; grid on; axis equal
xlabel('<- outside inside ->')
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(ax,rim_x,rim_y,'Color',colorRo,'LineStyle','-')
plot(ax,centerline_x,centerline_y,'Color',colorRo,'LineStyle','--')
plot(ax,tire_x,tire_y_u,'Color',colorTo,'LineStyle','-')
plot(ax,tire_x,tire_y_l,'Color',colorTo,'LineStyle','-')



% designer setup

D = 18; % in, rim diameter
Wb = 9; % in, rim width
S = 0; % mm, spacer width
J = 40; % mm, wheel J

W = Wb+1; % 1 in total bead
P = ceil((Wb+1)*25.4/5)*5; % mm, tire width
ToverP = round((2*To+Do-D*25.4)/2/P*100/5)*5; % percentage, tire aspect ratio
% J = round(W*25.4/2-x+S) % mm, offset
x = W*25.4/2-J+S % mm, dist from hub to wheel outer plane (73.5 is flush?)

fprintf('Wheel: %dx%0.1f %+dMM\n',D,Wb,J);
fprintf('Tire: P%d/%dR%d\n',P,ToverP,D);

colorR = [1 0 0]*0.5;
colorT = [1 1 1]*0.2;

T = P*ToverP/100; % tire height, mm
D = D*25.4; % R in mm
W = W*25.4; % W in mm



rim_x = [-W/2 W/2 W/2 -W/2 -W/2]-S+J; 
rim_y = [-D/2 -D/2 D/2 D/2 -D/2];

tire_x = [-P/2 P/2 P/2 -P/2 -P/2]-S+J; 
tire_y_u = [0 0 T T 0]+D/2;
tire_y_l = [0 0 -T -T 0]-D/2;

centerline_x = [0 0]-S+J;
centerline_y = [-D/2 D/2];

plot(ax,rim_x,rim_y,'Color',colorR,'LineStyle','-')
plot(ax,centerline_x,centerline_y,'Color',colorR,'LineStyle','--')
plot(ax,tire_x,tire_y_u,'Color',colorT,'LineStyle','-')
plot(ax,tire_x,tire_y_l,'Color',colorT,'LineStyle','-')