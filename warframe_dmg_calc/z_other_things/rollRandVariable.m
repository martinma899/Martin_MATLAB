function [outcome] = rollRandVariable(in)
% takes discrete random variable in with entries in.x and probability in.p
if numel(in.p)==1
  outcome = in.x;
else
  n = rand(1); % draw random number
  cdf = cumsum(in.p);
  for i = 1:numel(cdf)
    if n <= cdf(i)
      outcome = in.x(i);
      return;
    end
  end
end
end