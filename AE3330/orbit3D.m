clc;clear;clf;hold on

% define constants
% everything in SI units

RE = 6378.137e3 % earth radius
GM = 0.39860e6*1e9 % earth mew
e = 	0.74 % eccentricity
% hp = 2000e3; % altitude of perigee
% rp = hp+RE % radius of perigee 
% a = rp/(1-e) % semi-major axis
a = 26600e3
P = a*(1-e)*(1+e) % semilatus rectum

Omega = 135; % right ascension of the ascending node
inc = 63.4; % inclination
omega = 270; % argument of perigee

% J2000
J2000 = [1,0,0]'*2*RE;

% plot axis
plotaxes(RE*2);
view(120,30);
zerovec = [0 0 0]';

% draw earth
[Xe,Ye,Ze] = sphere(50);
Xe = Xe*RE;
Ye = Ye*RE;
Ze = Ze*RE;
surf(Xe,Ye,Ze,'EdgeColor',[1 1 1],'FaceAlpha',0.5);

% generate list of ellipse points
theta = linspace(0,2*pi,101);
rvec = P./(1+e*cos(theta));
xvec = rvec.*cos(theta);
yvec = rvec.*sin(theta);
zvec = rvec*0;
ellipmat = [xvec;yvec;zvec];

%plot3(xvec,yvec,zvec,'k.-');

% rotate the ellipse around z axis Omega degrees

ellipmat1 = rotUaroundV(ellipmat,[0 0 1]',Omega/180*pi);
%%plot3(ellipmat1(1,:),ellipmat1(2,:),ellipmat1(3,:),'r.-');

% also find new reference vector for the rotation of inclination
LN = rotUaroundV(J2000,[0 0 1]',Omega/180*pi);

% rotate new ellipse around LN; angle of inclination

ellipmat2 = rotUaroundV(ellipmat1,LN,inc/180*pi);
%plot3(ellipmat2(1,:),ellipmat2(2,:),ellipmat2(3,:),'g.-');

% also find h direction for the rotation of the argumetn of perigee

h = rotUaroundV([0 0 1]'*2*RE,LN,inc/180*pi);

% do the argument of perigee rotation

ellipmat3 = rotUaroundV(ellipmat2,h,omega/180*pi);
plot3(ellipmat3(1,:),ellipmat3(2,:),ellipmat3(3,:),'b.-');

% also find the vector that points towards perigee

Perigee = rotUaroundV(LN,h,omega/180*pi);

% plot all vectors
plotv3d([0;0;0],LN,'r');
text(LN(1),LN(2),LN(3),'Line of Nodes')
plotv3d([0;0;0],h,'g');
text(h(1),h(2),h(3),'h')
plotv3d([0;0;0],Perigee,'b')
text(Perigee(1),Perigee(2),Perigee(3),'Perigee')

% make the arcs that indicate the angles

% first, Omega. 
% the arc basically sweeps from x axis to LN by Omega 
% degrees in the xy plane

arct1 = linspace(0,Omega/180*pi,21);
arc1x = 1.5*RE*cos(arct1);
arc1y = 1.5*RE*sin(arct1);
arc1z = arct1*0;
plot3(arc1x,arc1y,arc1z,'k')
posvec1 = rotUaroundV(J2000/2*1.5,[0 0 1]',Omega/180*pi/2);
text(arc1x(11),arc1y(11),arc1z(11),'\Omega')

% second, inclination. 
arct2 = linspace(0,inc/180*pi,21);
arc2x = 1.5*RE*sin(arct2);
arc2y = arct2*0;
arc2z = 1.5*RE*cos(arct2);
arc2mat = [arc2x;arc2y;arc2z];
rotarc2mat = rotUaroundV(arc2mat,[0 0 1]',(Omega-90)/180*pi);
plot3(rotarc2mat(1,:),rotarc2mat(2,:),rotarc2mat(3,:),'k');
text(rotarc2mat(1,11),rotarc2mat(2,11),rotarc2mat(3,11),'i')

% third, argument of perigee. 
arct3 = linspace(Omega/180*pi,(Omega+omega)/180*pi,21);
arc3x = 1.5*RE*cos(arct3);
arc3y = 1.5*RE*sin(arct3);
arc3z = arct3*0;
arc3mat = [arc3x;arc3y;arc3z];
rotarc3mat = rotUaroundV(arc3mat,LN,inc/180*pi);
plot3(rotarc3mat(1,:),rotarc3mat(2,:),rotarc3mat(3,:),'k');
text(rotarc3mat(1,11),rotarc3mat(2,11),rotarc3mat(3,11),'\omega')

axis equal
grid on
title('Molnyia Orbit -- Martin''s Orbit Code')