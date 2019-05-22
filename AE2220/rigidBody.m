clc;clear

thetadot = -1;
I = [20 30]';

range = [-10 10 -10 10];
res = [10 10];

xlocvec = linspace(-10,10,10);
ylocvec = linspace(-10,10,10);

rvecs = [];
vvecs = [];

for i = xlocvec
  for j = ylocvec
    A = [i j]';
    
    IA = A-I;
    
    vA = [0 -thetadot;thetadot 0]*IA;
    
    rvecs = [rvecs A];
    vvecs = [vvecs vA];
  end
end

clf
hold on

plot(I(1),I(2),'rd')
quiver(rvecs(1,:),rvecs(2,:),vvecs(1,:),vvecs(2,:))
axis equal

















