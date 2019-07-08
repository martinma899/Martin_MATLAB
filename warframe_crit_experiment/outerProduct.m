function [C] = outerProduct (v1,v2)
% simplifies vector Cer product procedure so that we don't have to worry
% about whether the input vectors are column or row vectors
  if isempty(v1)||isempty(v2)
    C = [];return;
  else
  if isempty(any(size(v1)==1))
    error('v1 must be a 1xn or nx1 vector')
  elseif isempty(any(size(v2)==1))
    error('v2 must be a 1xn or nx1 vector')
  end
  end
  if isrow(v1)
    v1 = v1';
  end
  if iscolumn(v2)
    v2 = v2';
  end
  C = v1*v2;
end