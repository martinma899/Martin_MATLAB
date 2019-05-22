function [fv,pts,rarray] = curvatureexp3D(filename)
  % let's keep all 3D vectors row vectors
  fv = stlread(filename); disp('stl opened'); % read stl
  pts = unique(fv.vertices,'rows'); disp('unique complete');
  disp(size(pts));
  rarray = [];
  for i = 1:size(pts,1)
    pt = pts(i,:);
    neighbors = findNearestNeighbor(fv,pt);
    [~,r] = interpolateSphere(pt,neighbors);
    rarray = [rarray;r];
    fprintf('point %d\n',i)
    disp(r)
  end
end

function [ptOut] = findNormalBisectorCenter (ptArrIn)
  A = ptArrIn(1,:);
  B = ptArrIn(2,:);
  C = ptArrIn(3,:);
  ABmid = (A+B)/2;
  AB = B-A;
  ACmid = (A+C)/2;
  AC = C-A;
  n3 = cross(AB,AC);
  O3 = A;
  augmentedMat = [AB;AC;n3];
  augmentedMat = [augmentedMat [dot(ABmid,AB);dot(ACmid,AC);dot(n3,O3)]];
  reducedMat = rref(augmentedMat);
  ptOut = reducedMat(:,4)';
end









