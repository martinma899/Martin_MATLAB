function noteOut = putInKeySignature(noteIn,key)
  key(1) = upper(key(1));
  noteInSelf = noteIn(1);
  if length(noteIn) == 1
    noteInNumber = [];
  else
    noteInNumber = noteIn(2);
  end
  switch key
    case 'Cb'
          noteOutSelf = [noteInSelf 'b'];
    case 'C'
      noteOutSelf = noteInSelf;
    case 'C#'
      noteOutSelf = [noteInSelf '#'];
    case 'Db'
      switch noteInSelf
        case {'B','E','A','D','G'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'D'
      switch noteInSelf
        case {'F','C'}
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'Eb'
      switch noteInSelf
        case {'B','E','A'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'E'
      switch noteInSelf
        case {'F','C','G','D'}
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'F'
      switch noteInSelf
        case {'B'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'F#'
      switch noteInSelf
        case {'F','C','G','D','A','E'}
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'Gb'
      switch noteInSelf
        case {'B','E','A','D','G','C'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'G'
      switch noteInSelf
        case 'F'
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'Ab'
      switch noteInSelf
        case {'B','E','A','D'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'A'
      switch noteInSelf
        case {'F','C','G'}
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'Bb'
      switch noteInSelf
        case {'B','E'}
          noteOutSelf = [noteInSelf 'b'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    case 'B'
      switch noteInSelf
        case {'F','C','G','D','A'}
          noteOutSelf = [noteInSelf '#'];
        otherwise 
          noteOutSelf = noteInSelf;
      end
    otherwise
      error('Key signature error; input a correct key signature.')
  end
  noteOut = [noteOutSelf noteInNumber];
end