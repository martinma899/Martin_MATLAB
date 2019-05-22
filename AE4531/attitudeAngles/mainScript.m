clc;clear;close all

% first step: read in the airplane

fv = stlread('Simple_Airplane_Model_V2.stl');

% second step: orient and fix vertex positions

Rz = [cosd(90) -sind(90) 0; ...
      sind(90)  cosd(90) 0; ...
      0         0        1];
Rx = [1 0 0 ; ...
  0 cosd(180) -sind(180) ; ...
  0 sind(180) cosd(180)];
 
fv.vertices = (Rz*(fv.vertices)')';
fv.vertices(:,3) = fv.vertices(:,3)-20;
fv.vertices(:,1) = fv.vertices(:,1)+150;
fv.vertices = (Rx*(fv.vertices)')';


% inertial reference frame unit vectors and scale

frame_vis_scale_factor = 50;
ihati = [1 0 0]';
jhati = [0 1 0]';
khati = [0 0 1]';

ihatiscaled = ihati*frame_vis_scale_factor;
jhatiscaled = jhati*frame_vis_scale_factor;
khatiscaled = khati*frame_vis_scale_factor;

% make the rotation matrices
% intrinsic rotation: x-y-z, roll-pitch-yaw, phi-theta-psi


psi = -50;
theta = 25;
phi = 170;

Rroll = [1 0 0 ; ...
  0 cosd(phi) -sind(phi) ; ...
  0 sind(phi) cosd(phi)];

Rpitch = [cosd(theta) 0 sind(theta); ...
         0 1 0;...
         -sind(theta) 0 cosd(theta)];

Ryaw = [cosd(psi) -sind(psi) 0; ...
     sind(psi) cosd(psi) 0 ; ...
     0 0 1];       

% rotate the coordinates relative to body fixed reference frame
fv.vertices = (Ryaw*Rpitch*Rroll*(fv.vertices)')';

% compute some vectors for visualization purpose
intermediate_x_axis = Ryaw*ihatiscaled;
intermediate_y_axis = Ryaw*jhatiscaled;
final_x_axis = Ryaw*Rpitch*Rroll*ihatiscaled*3.5;

% compute arcs for visualization
arcR = 25;
res = 21;

% first, the yaw arc
yawarcx = cosd(linspace(0,psi,res))*arcR;
yawarcy = sind(linspace(0,psi,res))*arcR;
yawarcz = zeros(1,res);

% then, the pitch arc
pitcharcx = cosd(linspace(0,theta,res))*arcR;
pitcharcy = zeros(1,res);
pitcharcz = -sind(linspace(0,theta,res))*arcR;

temp = Ryaw*[pitcharcx;pitcharcy;pitcharcz];

pitcharcx = temp(1,:);
pitcharcy = temp(2,:);
pitcharcz = temp(3,:);

% then, the roll arc
initial_wing_vec_start = [100 0 0]';
initial_wing_vec = jhatiscaled;

final_wing_vec_start = Ryaw*Rpitch*Rroll*initial_wing_vec_start;
intermediate_wing_vec = Ryaw*Rpitch*initial_wing_vec;
final_wing_vec = Ryaw*Rpitch*Rroll*initial_wing_vec;

% then, the pitch arc

rollarcx = zeros(1,res)+initial_wing_vec_start(1);
rollarcy = cosd(linspace(0,phi,res))*arcR;+initial_wing_vec_start(2);
rollarcz = sind(linspace(0,phi,res))*arcR+initial_wing_vec_start(3);

temp = Ryaw*Rpitch*[rollarcx;rollarcy;rollarcz];

rollarcx = temp(1,:);
rollarcy = temp(2,:);
rollarcz = temp(3,:);


% visualization

hold on
% inertial reference frame unit vectors
plotv3d([0 0 0]',ihatiscaled,'k');
text(ihatiscaled(1),ihatiscaled(2),ihatiscaled(3),'N')
plotv3d([0 0 0]',jhatiscaled,'k');
text(jhatiscaled(1),jhatiscaled(2),jhatiscaled(3),'E')
plotv3d([0 0 0]',khatiscaled,'k');
text(khatiscaled(1),khatiscaled(2),khatiscaled(3),'D')

plotv3d([0 0 0]',intermediate_x_axis,'r');

plotv3d([0 0 0]',intermediate_y_axis,'r');
text(intermediate_y_axis(1),intermediate_y_axis(2),intermediate_y_axis(3),'Pitch Axis','Color','r');

plotv3d([0 0 0]',final_x_axis,'g');

plotv3d(final_wing_vec_start,intermediate_wing_vec,'g');
plotv3d(final_wing_vec_start,final_wing_vec,'g');

plot3(yawarcx,yawarcy,yawarcz,'m');
text(yawarcx(round(res/2)),yawarcy(round(res/2)),yawarcz(round(res/2)),'Yaw','Color','m');

plot3(pitcharcx,pitcharcy,pitcharcz,'m');
text(pitcharcx(round(res/2)),pitcharcy(round(res/2)),pitcharcz(round(res/2)),'Pitch','Color','m');

plot3(rollarcx,rollarcy,rollarcz,'m');
text(rollarcx(round(res/2)),rollarcy(round(res/2)),rollarcz(round(res/2)),'Roll','Color','m');



% airplane
renderSTL(fv)

% stuff
axis equal
axis off
grid on
view([-1 1 -1])
%view([0 1 0])
camroll(180)