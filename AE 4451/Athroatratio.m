function [out] = Athroatratio (M,r)
  % computes the quantity A/A*
  out = 1/M*((1+(r-1)/2*M^2)/((r+1)/2))^((r+1)/(2*(r-1)));
end