function [v,vy,indVec] = generate_v_and_vy(j,kappaarr,panelLengths,halfSpan,l)
  % produce the index of right half of v and vy vector
  tempHold1 = [];
  for i = 1:halfSpan
    tempInd = j+i;
    if tempInd>l
      tempInd = tempInd-l;
    end
    tempHold1 = [tempHold1 tempInd];
  end
  tempHold2 = [];
  for i = 1:halfSpan
    tempInd = j-i;
    if tempInd<1
      tempInd = tempInd+l;
    end
    tempHold2 = [tempInd tempHold2];
  end
  indVec = [tempHold2 j tempHold1];
  vy = kappaarr(indVec);
  panelLengths = panelLengths';
  lengthSegment1 = panelLengths([j tempHold1(1:end-1)]);
  lengthSegment2 = panelLengths(tempHold2);
  
  v1 = cumsum([0 lengthSegment1]);
  v2 = -cumsum([0 lengthSegment2(end:-1:1)]);
  v2 = v2(end:-1:2);
  v = [v2 v1];
  
  vy = vy';
end