function [bool,O] = intersection(xvec1,yvec1,xvec2,yvec2)
  if length(xvec1)~=2
    error('xvec1 dimension error');
  end
  if length(yvec1)~=2
    error('yvec1 dimension error');
  end
  if length(xvec2)~=2
    error('xvec2 dimension error');
  end
  if length(yvec2)~=2
    error('yvec2 dimension error');
  end

  A = [xvec1(1);yvec1(1)];
  B = [xvec1(2);yvec1(2)];
  C = [xvec2(1);yvec2(1)];
  D = [xvec2(2);yvec2(2)];
  
  AB = B-A;
  CD = D-C;
  if all((AB/norm(AB))==(CD/norm(CD)))
    bool = false;
    O = [];
    return;
  end
  mat = [AB -CD C-A];
  rrefmat = rref(mat);
  stvec = rrefmat(:,end);
  O = A+stvec(1)*AB;
  if O(1)>=min(xvec1)&&O(1)<=max(xvec1)...
      &&O(1)>=min(xvec2)&&O(1)<=max(xvec2)...
      &&O(2)>=min(yvec1)&&O(2)<=max(yvec1)...
      &&O(2)>=min(yvec2)&&O(2)<=max(yvec2)
    bool = true;
  else
    bool = false;
  end
  end