clc;clear;close all

% first read input file

%coords = readGeomFile('RAE2822.geom');
%coords = readGeomFile('s1091.dat');
%coords = readGeomFile('eppler376.dat');
%coords = readGeomFile('naca0012.dat');
%coords = readGeomFile('naca2412.dat');
%coords = readGeomFile('naca23012.dat');
%coords = readGeomFile('nacasc(2)-0612.dat');
%coords = readGeomFile('fx79w151a.dat');
%coords = readGeomFile('ONERAHOR07.dat');
%coords = readGeomFile('MH112.dat');
coords = readGeomFile('GIIIBL0.dat');

% let's obtain 


[length,~] = size(coords);
kappaarr = [];


for i = 1:length
  
  % find an example trio A B C
  % [A,B,C] = findAdjacentPoints(coords,i);
  
  %   A = [0.8000     -0.0150]'
  % B = [0.9000     -0.0082]'
  % C = [0.9500     -0.0048]'
  
  B = coords(i,:)';
  if i == length
    C = coords(2,:)';
  else
    C = coords(i+1,:)';
  end
  if i == 1
    A = coords(length-1,:)';
  else
    A = coords(i-1,:)';
  end
  
  %
  % plot A B C
  %   subplot(2,1,2)
  %   clf
  %   hold on
  %   plot(coords(:,1),coords(:,2),'b.-');
  %   ABCarr = [A B C];
  %   plot(ABCarr(1,:),ABCarr(2,:),'ro');
  %
  % testing solve for curvature
  
  AB = B-A;
  BC = C-B;
  
  ABslope = AB(2)/AB(1);
  BCslope = BC(2)/BC(1);
  
  threshold = 1e-18;
  
  [O,r,kappa,determinant] = solveForCurvature (A,B,C);
  disp(abs(determinant))
  
  if abs(determinant)<=threshold
    kappa = 0;
  else
  
%     clf
%   plot(coords(:,1),coords(:,2),'b.-');
%   hold on
%   
%   % plot O and see if it makes sense
%   plot(O(1),O(2),'bo');
%   
%   % draw the "Tangent" circle
%    circle(O,r);
%    axis equal
  end
  
  kappaarr = [kappaarr;kappa];
 
end


% try highlighting points that require additional refinement
thresholdPercent = 0.1; % above 80% of roughness will get highlighted
[~,roughIndex] = sort(kappaarr,'descend');

roughIndex = roughIndex(1:ceil(length*(thresholdPercent)));
roughCoords = coords(roughIndex,:);

zscores = (kappaarr-median(kappaarr))/std(kappaarr);
roughIndex2 = zscores>=0.3;
roughCoords2 = coords(roughIndex2,:);

subplot(2,2,1);
semilogy(coords(:,1),kappaarr,'r.-');
xlabel('x/c')
ylabel('kappa')
%title('GIIIBL0')

subplot(2,2,2)
hist(zscores,1000)
xlabel('z score of kappa for every node')
ylabel('frequency')

subplot(2,2,3)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords(:,1),roughCoords(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
title('10% of sharpest nodes, round up')

subplot(2,2,4)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords2(:,1),roughCoords2(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
title('z score (around median) greater than 0.3')








