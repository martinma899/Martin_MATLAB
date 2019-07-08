function [mu] = randVarMean (in)
% takes a discrete random variable in with in.x being discrete values and
% in.p being probability
mu = dot(in.x,in.p);
end