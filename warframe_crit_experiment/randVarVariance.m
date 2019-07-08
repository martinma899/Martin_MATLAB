function [mu] = randVarVariance (in)
% takes a discrete random variable in with in.x being discrete values and
% in.p being probability
mu = dot((in.x-randVarMean(in)).^2,in.p);
end