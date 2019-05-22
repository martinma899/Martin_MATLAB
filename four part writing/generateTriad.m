function [notes] = generateTriad(key,chordLevel)
  scale = generateScale(key);
  switch chordLevel
    case 'I'
      notes{1} = scale{1};
      notes{2} = scale{3};
      notes{3} = scale{5};
    case 'IV'
      notes{1} = scale{4};
      notes{2} = scale{6};
      notes{3} = scale{1};
    case 'V'
      notes{1} = scale{5};
      notes{2} = scale{7};
      notes{3} = scale{2};
    otherwise
      error('please only use I, IV and V chords');
  end
end