clc;clear;close all

% OEM setup
P = 225; % mm, tire width
ToverP = 50; % percentage, tire aspect ratio
D = 17; % in, rim diameter
W = 7.5+1; % in, rim width
J = 55; % mm, offset
S = 0; % mm, spacer width
colorR = [1 0 0];
colorT = [0 0 0];

T = P*ToverP/100; % tire height, mm
D = D*25.4; % R in mm
W = W*25.4; % W in mm

rim_x = [-W/2 W/2 W/2 -W/2 -W/2]-S+J; 
rim_y = [-D/2 -D/2 D/2 D/2 -D/2];

tire_x = [-P/2 P/2 P/2 -P/2 -P/2]-S+J; 
tire_y_u = [0 0 T T 0]+D/2;
tire_y_l = [0 0 -T -T 0]-D/2;


figure(1)
ax = gca; hold on; grid on; axis equal
xlabel('<- outside inside ->')
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
plot(ax,rim_x,rim_y,'Color',colorR,'LineStyle','-')
plot(ax,tire_x,tire_y_u,'Color',colorT,'LineStyle','-')
plot(ax,tire_x,tire_y_l,'Color',colorT,'LineStyle','-')

% wheels: Concept One RS8 Matte Black/Machined
% sticks a little over fender
% P = 255; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 10; % in, rim width
% J = 35; % mm, offset
% S = 0; % mm, spacer width

% wheels: enkei nt03
% P = 245; % mm, tire width
% ToverP = 40; % percentage, tire aspect ratio
% D = 18; % in, rim diameter
% W = 9.5; % in, rim width
% J = 27; % mm, offset
% S = 0; % mm, spacer width

% wheels: Rohana RC10
% tucks in fender
% P = 235; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 10; % in, rim width
% J = 30; % mm, offset
% S = 0; % mm, spacer width

% wheels: TSW Mirabeau Silver with Polished Lip
% quite flush with rear fender
% P = 255; % mm, tire width
% ToverP = 35; % percentage, tire aspect ratio
% D = 19; % in, rim diameter
% W = 9.5; % in, rim width
% J = 40; % mm, offset
% S = 0; % mm, spacer width

% wheels: TSW Mirabeau Silver with Polished Lip
% quite flush with front fender
% P = 235; % mm, tire width
% ToverP = 35; % percentage, tire aspect ratio
% D = 19; % in, rim diameter
% W = 8; % in, rim width
% J = 35; % mm, offset
% S = 0; % mm, spacer width

% P = 235; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 18; % in, rim diameter
% W = 9.5; % in, rim width
% J = 15; % mm, offset
% S = 0; % mm, spacer width

% slight poke in the front
% vossen CV5
% P = 245; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 9; % in, rim width
% J = 38; % mm, offset
% S = 0; % mm, spacer width

% poke in the front
% vossen CVT
% P = 255; % mm, tire width
% ToverP = 30; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 10.5; % in, rim width
% J = 45; % mm, offset
% S = 0; % mm, spacer width

% wheels:  Motegi (Powdercoated White Chameleon teal)
% top of the rim flush with fender at max slam
% P = 245; % mm, tire width
% ToverP = 35; % percentage, tire aspect ratio
% D = 20; % in, rim diameter
% W = 10.5; % in, rim width
% J = 8; % mm, offset
% S = 0; % mm, spacer width

P = 245;
ToverP = 40; 
D = 18; 
W = 8.5+1; 
J = 38; 
S = 0;

colorR = [1 0 0]*0.5;
colorT = [1 1 1]*0.2;

T = P*ToverP/100; % tire height, mm
D = D*25.4; % R in mm
W = W*25.4; % W in mm

rim_x = [-W/2 W/2 W/2 -W/2 -W/2]-S+J
rim_y = [-D/2 -D/2 D/2 D/2 -D/2];

tire_x = [-P/2 P/2 P/2 -P/2 -P/2]-S+J; 
tire_y_u = [0 0 T T 0]+D/2;
tire_y_l = [0 0 -T -T 0]-D/2;
plot(ax,rim_x,rim_y,'Color',colorR,'LineStyle','-')
plot(ax,tire_x,tire_y_u,'Color',colorT,'LineStyle','-')
plot(ax,tire_x,tire_y_l,'Color',colorT,'LineStyle','-')