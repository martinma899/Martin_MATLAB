function [num] = interval2num (interval)
% converts an interval string to a number
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
num = find(strcmp(interval,interval_arr))-1;

end