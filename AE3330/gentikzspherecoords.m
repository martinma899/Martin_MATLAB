clc;clear

r = 1.5;

% twenty one points per circle, last and first are the same point
ptsPerCirc = 31;
circleAngles = linspace(0,2*pi,ptsPerCirc);

% five rings of latitude
latitudeCircNum = 4;

latitudeAngles = linspace(0,2*pi,latitudeCircNum+1);
latitudeAngles(end) = [];

% generate the first latitude circle
firstCircX = r*cos(circleAngles);
firstCircY = 0*circleAngles;
firstCircZ = r*sin(circleAngles);

firstCirc = [firstCircX;firstCircY;firstCircZ];

% now transform every one of them and write them out
for i = 1:latitudeCircNum
  thisPhi = latitudeAngles(i); % extract this transformation angle
  mat = [cos(thisPhi) -sin(thisPhi) 0;
              sin(thisPhi) cos(thisPhi) 0;
              0            0             1];
  thisCirc = mat*firstCirc;
  
  fprintf('%s\n','\draw')
  % now write the coordinates out
  for j = 1:ptsPerCirc
    if j ~= ptsPerCirc
      fprintf('(%1.4f,%1.4f,%1.4f) -- \n',thisCirc(1,j),thisCirc(2,j),thisCirc(3,j));
    else
      fprintf('(%1.4f,%1.4f,%1.4f) ; \n',thisCirc(1,j),thisCirc(2,j),thisCirc(3,j));
    end
  end
  fprintf('\n')
end


% now let us draw every latitude

numLatitudes = 7;
latitudeAngles = linspace(0,pi,numLatitudes+2);
latitudeAngles(1) = [];
latitudeAngles(end) = [];

for i = 1:numLatitudes
  theta = latitudeAngles(i);
  h = r*cos(theta);
  rthis = r*sin(theta);
  
  latCircX = rthis*cos(circleAngles);
  latCircY = rthis*sin(circleAngles);
  latCircZ = ones(1,ptsPerCirc)*h;

  latCirc = [latCircX;latCircY;latCircZ];
  
  fprintf('%s\n','\draw')
  % now write the coordinates out
  for j = 1:ptsPerCirc
    if j ~= ptsPerCirc
      fprintf('(%1.4f,%1.4f,%1.4f) -- \n',latCirc(1,j),latCirc(2,j),latCirc(3,j));
    else
      fprintf('(%1.4f,%1.4f,%1.4f) ; \n',latCirc(1,j),latCirc(2,j),latCirc(3,j));
    end
  end
  fprintf('\n')
  
end







