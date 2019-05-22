function [O,r,kappa] = solveForCurvature (data)

% input data is an n by 2 array
% every row represents the x,y value of a point
% there are a total of n points

vecs = diff(data,1);
s = size(vecs,1);
% vecs are the AB, BC, CD, ...
mids = (data(1:end-1,:)+data(2:end,:))./2;
% mids are the ABmid, BCmid, CDmid, ...

b = zeros(s,1);
for i = 1:s
  b(i) = dot(vecs(i,:),mids(i,:));
end

if s>2
  O = (vecs'*vecs)\(vecs'*b);
  rarr = zeros(s+1,1);
  for i = 1:(s+1)
    rarr(i) = norm(O-data(i,:)');
  end
  r = mean(rarr);
else
  O = vecs\b;
  r = norm(O-data(2,:)');
end
  kappa = 1/r;
end