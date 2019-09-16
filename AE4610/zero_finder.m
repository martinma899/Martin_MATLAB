function [t0] = zero_finder(t,x)

% count every successive pair of entries. 
% if any pair of them cross 0, then use linear formula to estimate
% interception. 
t0 = [];
counter = 1;
while true
  x1 = x(counter);
  x2 = x(counter+1);
  t1 = t(counter);
  t2 = t(counter+1);
  
% do stuff 
  if x1==0
    t0 = [t0 t1];
  elseif (x1>0&&x2<0)||(x1<0&&x2>0)
    t0this = (-t1*x2+x1*t2)/(x1-x2);
    t0 = [t0 t0this];
  end
  counter = counter+1;
  if counter>=(numel(x)-1)
    break;
  end
end