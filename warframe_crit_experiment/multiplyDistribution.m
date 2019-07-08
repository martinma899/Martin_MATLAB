function out = multiplyDistribution(d1,d2)
% assuming all events in d1 and d2 are independent, 
% this function outputs the distribution if the random variables were to
% multiply each other
% d1, d2 must be objects with field x and p. x is the random variable, p is
% the probability vector. 
out.x = outerProduct(d1.x,d2.x);
out.p = outerProduct(d1.p,d2.p);

out.x = reshape(out.x,1,numel(out.x));
out.p = reshape(out.p,1,numel(out.p));

out = fixDiscreteDistribution(out);
end