function [xarr,yarr,tarr] ...
  = produceNonLinspaceSemiCircle(r,maxStep,maxPts,decFac)
% the spacing of pi keeps decreasing
xarr = [];
yarr = [];
tarr = [];
thist = 0;
count = 0;
while true
  count = count+1;
  if count==maxPts
    xarr = [xarr;-r];
    yarr = [yarr;0];
    tarr = [tarr;pi];
    break
  end
  if thist>=pi
    xarr = [xarr;-r];
    yarr = [yarr;0];
    tarr = [tarr;pi];
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
xarr = -xarr;
disp(numel(tarr))
end