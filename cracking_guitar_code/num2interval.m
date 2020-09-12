function [interval] = num2interval (num)
% converts a number to an interval string. 
% interval string has the format of '+/-name num oct'
% ex. '-minor 2nd 1 oct' is minor second plus 1 octave, negative interval 
interval_arr = {'unison/octave';
  'minor 2nd';
  'major 2nd';
  'minor 3rd';
  'major 3rd';
  'perfect 4th';
  'augmented 4th';
  'perfect 5th';
  'minor 6th';
  'major 6th';
  'minor 7th';
  'major 7th'};
if num>=0
  sign = '+';
else
  sign = '-';
end

num = abs(num);
interval_ind = mod(num,12)+1;
oct = floor(num/12);
interval = sprintf('%s%s +%d oct',sign,interval_arr{interval_ind},oct);

end