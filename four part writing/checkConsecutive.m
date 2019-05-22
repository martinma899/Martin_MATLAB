function out = checkConsecutive (logicalIn)
  if length(logicalIn) == 1
    out = false;
  else
    for i = 1:(length(logicalIn)-1)
      if all(logicalIn(i:i+1))
        out = true;
        return;
      end
    end
  end
  out = false;
end