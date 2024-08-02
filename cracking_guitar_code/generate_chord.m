function fingerboard = generate_chord(bass_string,chord,bass,interval_arr,f_ind)

% bass_string: 6, 5 or 4
% chord: notes in the chord. Ex: major would be 1 5 8
% f_ind: starting fret of first bass note

% construct the guitar fingerboard matrix
% all zeros for now
gmat = zeros(6,12);

% initializ fret index
f_ind = f_ind+1; % 0 fret = 1 ind
% initialize note to 1
note = bass;

% start filling in chromatic notes in
for i = bass_string:-1:1 % string number
  
  while true % loop through the frets
    % fill in the note
    gmat(i,f_ind) = note;
    % increment fret
    f_ind = f_ind+1;
    
    % check if fret should flow to the next string
    if f_ind > 12 % if we overflowed
      f_ind = 1; % reset f_ind
      if i == 3
        note = note - 7;
      else
        note = note - 6;
      end
      if note < 1
        note = note+12;
      end
      break;
    else % if not overflowing strings
      % increment note and loop back to 1 if necessary
      note = note+1;
      if note > 12
        note = note-12;
      end
    end
    
  end
end

% disp(gmat)

% validate interval_arr
if ~(iscell(interval_arr)&&isequal(size(interval_arr),[1 12]))
interval_arr = ...
  {'  1' ' b2' '  9' ' b3' '  3' ' 11' ' #11' '  5' ' #5' '  6' ' b7' '  7'};
end

fingerboard = char(32*ones(7,55));

for i = 1:6 % loop through all the strings
  for j = 1:12 % loop through all the frets
    note = gmat(i,j);
    if any(chord==note)
      fingerboard(i,(1+(j-1)*5):(j*5)) = ...
        sprintf(' %s|',interval_arr{note});
    else
      fingerboard(i,(1+(j-1)*5):(j*5)) = ...
        sprintf('    |');
    end
  end
end
% print fret numbers
for j = 1:12
  fingerboard(7,(1+(j-1)*5):(j*5)) = sprintf('%5d',j-1);
end

end
