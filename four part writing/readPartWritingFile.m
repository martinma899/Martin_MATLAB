function out = readPartWritingFile(fname)

  fid = fopen(fname); % open file
  out.key = fgetl(fid); % get key signature
  out.chordCellArr = {}; % initialize chord character cell array
  out.chordNames = {};
  line = fgetl(fid); 
  out.numChords = 0;
  while ischar(line)&&~isempty(line)
    [B,T,A,S,chord] = splitCharacters(line); % find SATB note letters
    B = putInKeySignature(B,out.key); % put SATB without accidentals
    T = putInKeySignature(T,out.key); % in key signature with accidentals
    A = putInKeySignature(A,out.key);
    S = putInKeySignature(S,out.key);
    % concatenante them in the total cell array
    out.chordCellArr = [out.chordCellArr {S A T B}']; 
    % record chord name
    out.chordNames = [out.chordNames {chord}];
    % keep track of number of chords
    out.numChords = out.numChords+1;
    line = fgetl(fid);
  end
  
  out.chordNumericalArr = zeros(4,out.numChords);
  for i = 1:numel(out.chordNumericalArr)
    out.chordNumericalArr(i) = noteToNumber(out.chordCellArr{i});
  end
    
  
  
  fclose(fid);

end