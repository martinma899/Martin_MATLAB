function out = combineDistribution(d1,d2,type,fixDist)
% assuming all events in d1 and d2 are independent, 
% this function outputs the distribution if the random variables were to
% add or multiply each other
% d1, d2 must be objects with field x and p. x is the random variable, p is
% the probability vector.
switch type
  case 'add'
    out.x = martinAddition(d1.x,d2.x);
  case 'multiply'
    out.x = outerProduct(d1.x,d2.x);
  otherwise
    error('please enter ''add'' or ''multiply'' for the third variable')
end
out.p = outerProduct(d1.p,d2.p);

out.x = reshape(out.x,1,numel(out.x));
out.p = reshape(out.p,1,numel(out.p));

if fixDist
out = fixDiscreteDistribution(out);
end
end