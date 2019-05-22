function cellout = generateScale(key)
  genericScale = {'C' 'D' 'E' 'F' 'G' 'A' 'B'};
  justKeyLetter = key(1);
  pickWhichToStart = find(strcmp(genericScale,justKeyLetter));
  reShuffleIndex = mod(pickWhichToStart:pickWhichToStart+6,7);
  reShuffleIndex(reShuffleIndex==0) = 7;
  cellout = genericScale(reShuffleIndex);
  for i = 1:7
    cellout{i} = putInKeySignature(cellout{i},key);
  end
end