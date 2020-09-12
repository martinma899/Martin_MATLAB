function [note] = number2note (number)
% This function converts a number representation of a note to the string
% that represents this note. 
% C1 = 0. 
% For example: input is 1, output is 'C#/Db1'

if number<0
  error('cannot input a number smaller than 0. lowest note is 0=C1')
end

% define default 12 note name array
note_str_arr = {'C' 'C#/Db' 'D' 'D#/Eb' 'E' 'F' 'F#/Gb' 'G' 'G#/Ab' 'A' 'A#/Bb' 'B'};

octave = floor(number/12)+1; % tells which octave it is. 
r = mod(number,12); % tells which note it is. 0 = first note.  

note = [note_str_arr{r+1} num2str(octave)];

end