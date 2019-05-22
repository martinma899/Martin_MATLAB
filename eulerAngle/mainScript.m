clc;clear;close all
figure(1)
hold on

animation = true;

psi = 3*pi/2;
theta = 0;
phi = 0;

A = [1 1 1];
B = [-1 1 1];
C = [-1 -1 1];
D = [1 -1 1];
E = [1 1 -1];
F = [-1 1 -1];
G = [-1 -1 -1];
H = [1 -1 -1];
O = [0 0 0];
T = [0 0 1];

mainArr = [A;B;C;D;E;F;G;H;O;T]';

if animation
  
  psi = 0;
  theta = 0;
  phi = 0;
  
  psispeed = 0;
  thetaspeed = 0;
  phispeed = 0.5;
  pauseLength = 0.1;
  
  psiinc = psispeed*pauseLength;
  thetainc = thetaspeed*pauseLength;
  phiinc = phispeed*pauseLength;
  
  while true
    R1psi = [cos(psi) sin(psi) 0;
      -sin(psi) cos(psi) 0;
      0 0 1];
    R2theta = [1 0 0;
      0 cos(theta) sin(theta);
      0 -sin(theta) cos(theta)];
    R3phi = [cos(phi) sin(phi) 0;
      -sin(phi) cos(phi) 0;
      0 0 1];
    thisArr = inv(R1psi)*inv(R2theta)*inv(R3phi)*mainArr;
    plotArr = thisArr(:,[1 2 3 4 1 5 6 2 6 7 3 7 8 4 8 5 9 10]);
    plotObject(plotArr,true);
    pause(pauseLength);
    psi = psi+psiinc;
    theta = theta+thetainc;
    phi = phi+phiinc;
  end
  
else
  R1psi = [cos(psi) sin(psi) 0;
    -sin(psi) cos(psi) 0;
    0 0 1];
  R2theta = [1 0 0;
    0 cos(theta) sin(theta);
    0 -sin(theta) cos(theta)];
  R3phi = [cos(phi) sin(phi) 0;
    -sin(phi) cos(phi) 0;
    0 0 1];
  thisArr = inv(R1psi)*inv(R2theta)*inv(R3phi)*mainArr;
  plotArr = thisArr(:,[1 2 3 4 1 5 6 2 6 7 3 7 8 4 8 5 9 10]);
  plotObject(plotArr,false);
  thisArr = mainArr;
  plotArr = thisArr(:,[1 2 3 4 1 5 6 2 6 7 3 7 8 4 8 5 9 10]);
  plotObject(plotArr,false);
  view(3)
end









