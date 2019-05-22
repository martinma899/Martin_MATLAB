function [newvec] = produceNewVec(oldvec,maxInd,res,abs_lim)
  oldSpacing = abs(oldvec(1)-oldvec(end))/res;
  newLowerBound = oldvec(maxInd)-oldSpacing;
  newUpperBound = oldvec(maxInd)+oldSpacing;
  if newLowerBound < abs_lim(1)
    newLowerBound = abs_lim(1);
  end
  if newUpperBound > abs_lim(2)
    newUpperBound = abs_lim(2);
  end
  newvec = linspace(newLowerBound,newUpperBound,res);
end