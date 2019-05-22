clc;clear;close all

coords = readGeomFile('nacasc(2)-0612.dat');
coords(end,:) = [];
x = coords(:,1);
y = coords(:,2);
l = numel(x);
bullvec = logical(zeros(1,l));
dets = zeros(1,l);
threshold = 1e-17;

for i = 1:l
 Aind = i-1;
 Bind = i;
 Cind = i+1;
 if Aind<1
  Aind = l;
 end
 if Cind>l
  Cind = 1;
 end
 A = [x(Aind) y(Aind)];
 B = [x(Bind) y(Bind)];
 C = [x(Cind) y(Cind)];
 determinant = abs(det([B-A;C-B]));
 dets(i) = determinant;
 if determinant<=threshold
  bullvec(i) = true;
 else
  bullvec(i) = false;
 end
end
plot(x,y,'b.-');
hold on
plot(x(bullvec),y(bullvec),'ro')

% write airfoil back
% fid = fopen('nacasc(2)-0612_good.dat','w');
% xfixed = x(~bullvec);
% yfixed = y(~bullvec);
% for i = 1:numel(xfixed)
%  fprintf(fid,'%1.3e %1.3e\n',xfixed(i),yfixed(i));
% end
% fprintf(fid,'%1.3e %1.3e\n',xfixed(1),yfixed(1));











