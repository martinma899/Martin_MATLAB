function num = noteToNumber (noteIn)
  noteInNumber = str2num(noteIn(end));
  noteInSelf = noteIn; 
  noteInSelf(end) = [];
  switch noteInSelf
    case {'C' 'B#'}
      num = 1;
    case {'C#' 'Db'}
      num = 2;
    case {'D'}
      num = 3;
    case {'D#' 'Eb'}
      num = 4;
    case {'Fb' 'E'}
      num = 5;
    case {'F' 'E#'}
      num = 6;
    case {'F#' 'Gb'}
      num = 7;
    case {'G'}
      num = 8;
    case {'G#' 'Ab'}
      num = 9;
    case {'A'}
      num = 10;
    case {'A#' 'Bb'}
      num = 11;
    case {'B' 'Cb'}
      num = 12;
    otherwise
      error('Could not convert note in lettering to number.')
  end  
  num = num+12*(noteInNumber-1);
end