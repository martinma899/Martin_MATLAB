function [number] = note2number (note)
% This function converts string representation of a note to a number that
% represents this note. 
% C1 = 0. 
% For example: input is 'C#/Db1', output is 1

% define default 12 note name array
note_str_arr = {'C' 'C#/Db' 'D' 'D#/Eb' 'E' 'F' 'F#/Gb' 'G' 'G#/Ab' 'A' 'A#/Bb' 'B'};

% first step, deconstruct the note and run validations. 
% check the last 2 digits to truncate all numbers. 
% Then convert the string to octave number. 
octave_str = [];
while true
  if 49<=double(note(end))&&double(note(end))<=58
    octave_str = [octave_str note(end)];
    note(end) = [];
  else
    break;
  end
end

if isempty(octave_str)
error('note must end with a number indicating octave')
end

octave = str2double(octave_str);
note_num = find(strcmp(note,note_str_arr))-1;

if isempty(note_num)
error('note name incorrect')
end

number = (octave-1)*12+note_num;

end