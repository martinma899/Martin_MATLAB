function [neighbors] = findNearestNeighbor(fv,pt)
  % The output neighbors is 2nx3 matrix.
  % n is number of triangles that include pt
  % the points come in pairs of two
  % they do repeat
  % but their order indicates which two are together
  [numOfFaces,~] = size(fv.faces);
  neighbors = [];
  for i = 1:numOfFaces 
    thisFace = fv.faces(i,:);% extract indicies of this face
    theseThreePts = fv.vertices(thisFace,:);% find the three pts of the face
    % the following algorithm returns a 3x1 logical vector
    % indicating given the three pts of a face, whether pt 
    % is one of them or not
    isPtThere = [];
    for j = 1:3
      if all(pt==theseThreePts(j,:))
        isPtThere = [isPtThere,true];
      else
        isPtThere = [isPtThere,false];
      end
    end
    if any(isPtThere)
      % if this face does contain point of interest
      % put the other two points in the neighbor array
      neighbors = [neighbors;theseThreePts(~isPtThere,:)];
    end
  end
  neighbors = unique(neighbors,'rows');
end