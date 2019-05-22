clc;close all; % housekeeping

%[fv,pts,rarray] = curvatureexp3D('ellipsoid.STL');

%load('test part 2 fv.mat');
%load('test part 2 r array.mat');
%load('test part 2 pts.mat');

load('ellipsoid fv.mat');
load('ellipsoid r array.mat');
load('ellipsoid pts.mat');

%load('F-22 fv.mat');
%load('F-22 r array.mat');
%load('F-22 pts.mat');

close all
hold on
renderSTL(fv); disp('stl rendered')
[~,curveindex] = sort(rarray,'ascend');
cutoff = 0.05;
criticalPts = pts(curveindex(1:round(cutoff*size(pts,1))),:);
plot3(criticalPts(:,1),criticalPts(:,2),criticalPts(:,3),'ro');
axis equal
figure(2)
histogram(rarray,200)