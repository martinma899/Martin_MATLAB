function [out1,out2,out3,out4,out5] = splitCharacters(line)
  [out1,line] = strtok(line,' ');
  [out2,line] = strtok(line,' ');
  [out3,line] = strtok(line,' ');
  [out4,out5] = strtok(line,' ');
  out1 = eliminateSpace(out1);
  out2 = eliminateSpace(out2);
  out3 = eliminateSpace(out3);
  out4 = eliminateSpace(out4);
  out5 = eliminateSpace(out5);
end