function [out] = fixDiscreteDistribution(in)
% this function takes the input in which is a struct with fields x and p 
% vectors, which correspond to the random variable and its probability. The
% algorithm first eliminates 0 probability entries, then combines multiple
% probability instances of the same x entry. 

% remove 0 probability entries
ind1 = in.p==0;
in.p(ind1) = [];
in.x(ind1) = [];

i = 0;
while true % infinite loop setup
  i = i+1; % add 1 to counter first
  if i>numel(in.x) % if we beyond last entry, then break out of loop
    break;
  end
  % the numeric index of all of the same current random variable value
  ind = find(in.x==in.x(i));
  if numel(ind)==1 % if this is the only one
    continue;
  else % if repeated instances are spotted,
    in.p(i) = sum(in.p(ind)); % replace the probability of this entry with the sum of probability of all found entries
    in.x(ind(2:end)) = []; % delete all but the first instance of the repeating random variable entry
    in.p(ind(2:end)) = []; % delete remaining repeating entries in the probability vector
  end
end
out = in;
end