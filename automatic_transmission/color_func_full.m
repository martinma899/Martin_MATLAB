function cvec = color_func_full(c,w,k)
% c: 0 to 1 color picker
% w: 0 to 1 white
% k: 0 to 1 black
% cvec: 1x3 color vector from 0 to 1

if c<0
  c = 0;
elseif c > 1
  c = 1;
end

if c >=0 && c < 1/6
  R = 1;
  G = 6*c;
  B = 0;
elseif c>=1/6 && c < 2/6
  R = -6*(c-2/6);
  G = 1;
  B = 0; 
elseif c>=2/6 && c < 3/6
  R = 0;
  G = 1; 
  B = 6*(c-2/6);
elseif c>=3/6 && c < 4/6
  R = 0;
  G = -6*(c-4/6);
  B = 1;
elseif c >=4/6 && c < 5/6
  R = 6*(c-4/6);
  G = 0;
  B = 1;
else
  R = 1;
  G = 0;
  B = -6*(c-1);
end

cvec = ([R G B]+([1 1 1]-[R G B])*w)*(1-k);
cvec(cvec>1) = 1;

end