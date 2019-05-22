function [noOctaveNum] = determineInterval(num1,num2)
  num = abs(num2-num1);
  noOctaveNum = mod(num,12);
%   switch noOctaveNum
%     case 0
%       str = 'P8';
%     case 1
%       str = 'm2';
%     case 2
%       str = 'M2';
%     case 3
%       str = 'm3';
%     case 4
%       str = 'M3';
%     case 5
%       str = 'P4';
%     case 6
%       str = 'A4';
%     case 7
%       str = 'P5';
%     case 8
%       str = 'm6';
%     case 9
%       str = 'M6';
%     case 10
%       str = 'm7';
%     case 11
%       str = 'M7';
%     case 12
%       str = 'P8';
%     otherwise
%       error('Cannot determine the name of the interval.')
%   end
end