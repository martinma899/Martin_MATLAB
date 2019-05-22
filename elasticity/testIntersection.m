clc;clear;close all;
hold on;
pause(1)



trials = 10000;
success = 0;
probability = [];
for i = 1:trials
  %disp(i);
  xvec1 = rand(1,2);
  xvec2 = rand(1,2);
  yvec1 = rand(1,2);
  yvec2 = rand(1,2);
  [bool,~] = intersection(xvec1,yvec1,xvec2,yvec2);
  if bool
    success = success+1;
  end
  thisprob = success/i;
  disp(thisprob);
  probability = [probability;thisprob];
  clf;
  plot(probability);
  hold on
  plot(1:length(probability),ones(1,length(probability))*0.232239210);
  pause(0.001);
end



%{
if ~isempty(O)
  hold on
  plot(xvec1,yvec1,'Color','b','Marker','o');
  plot(xvec2,yvec2,'Color','r','Marker','o');
  plot(O(1),O(2),'Color','m','Marker','s');
end
%}