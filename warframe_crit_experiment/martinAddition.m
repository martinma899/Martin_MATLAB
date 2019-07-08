function [C] = martinAddition (v1,v2)
  % a type of vector addition where it's the same as vector outer product
  % between v1 and v2 but only all the multiplication signs are replaced
  % with addition signs. 
  if isempty(v1)||isempty(v2)
    C = [];return;
  else
  if isempty(any(size(v1)==1))
    error('v1 must be a 1xn or nx1 vector')
  elseif isempty(any(size(v2)==1))
    error('v2 must be a 1xn or nx1 vector')
  end
  end
  m = numel(v1); n = numel(v2);
  onemat = ones(m,n);
  C = diag(v1)*onemat+onemat*diag(v2);
end