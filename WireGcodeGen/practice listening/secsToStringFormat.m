function [strout] = secsToStringFormat (timeLength)
  secs = round(mod(timeLength,60));
  mins = floor(timeLength/60);
  if secs>=10
    strout = [num2str(mins) ':' num2str(secs)];
  else
    strout = [num2str(mins) ':0' num2str(secs)];
  end
end