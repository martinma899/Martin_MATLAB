function [O,r] = interpolateSphere(A,neighbors)
  % construct the augmented matrix
  AMat = [];
  bvec = [];
  nNeighbors = size(neighbors,1);
  for i = 1:nNeighbors
    B = neighbors(i,:);
    AB = B-A;
    ABmid = (A+B)/2;
    AMat = [AMat;AB];
    bvec = [bvec;dot(ABmid,AB)];
  end
  reducedMat = rref([AMat'*AMat AMat'*bvec]);
  O = reducedMat(:,end)';
  rvec = norm(A-O);
  for i = 1:nNeighbors
    B = neighbors(i,:);
    rvec = [rvec;norm(B-O)];
  end
  r = mean(rvec);
end