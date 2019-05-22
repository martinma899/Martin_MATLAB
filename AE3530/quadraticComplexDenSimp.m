function [kai1,kai2] = quadraticComplexDenSimp(a,b,alpha,omega)

% the function takes the expression in the form of 
%        as+b
% -------------------
% (s+alpha)^2+omega^2
% and turns it into
%              omega                  s+alpha
% kai1 ------------------- + kai2 -------------------
%      (s+alpha)^2+omega^2        (s+alpha)^2+omega^2
% and returns kai1 and kai2
% this makes inverse laplace very easy. kai1 is sin factor, kai2 is cos
% factor. 

kai1 = (b-a*alpha)/omega;
kai2 = a;

end