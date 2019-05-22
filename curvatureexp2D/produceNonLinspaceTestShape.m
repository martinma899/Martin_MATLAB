function [xarr,yarr,tarr] ...
  = produceNonLinspaceTestShape(r,maxStep,maxPts,decFac)
% the spacing of pi keeps decreasing
xarr = [];
yarr = [];
tarr = [];
thist = 0;
count = 0;
while true
  count = count+1;
  if count==maxPts
    xarr = [xarr;0];
    yarr = [yarr;1];
    tarr = [tarr;pi/2];
    break
  end
  if thist>=pi/2
    xarr = [xarr;0];
    yarr = [yarr;1];
    tarr = [tarr;pi/2];
    break
  end
  x = r*cos(thist);
  y = r*sin(thist);
  xarr = [xarr;x];
  yarr = [yarr;y];
  tarr = [tarr;thist];
  
  thist = thist+maxStep;
  maxStep = maxStep*decFac; % use maxStep for first panel
end
yarr = [yarr;1-xarr(end-1:-1:1)];
xarr = [-xarr;xarr(end-1:-1:1)];
xarr = xarr(end:-1:1);
yarr = yarr(end:-1:1);
tarr = [];
end