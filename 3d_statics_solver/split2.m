function out = split2(str,delim)
out = {}; 
while ~isempty(str)
  [str1,str] = strtok(str,delim);
  if isempty(str1)
    continue;
  end
  out = [out;{str1}];
end
end