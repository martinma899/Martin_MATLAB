clc;clear;fclose('all');

filename = 'case4.avl';
res = 21;
alfa = linspace(-10,15,res);
clarr = zeros(1,res);
cdiarr = zeros(1,res);
cdarr = zeros(1,res);

for i = 1:res
  disp(i);
  [cl,cdi,cd] = avl(filename,alfa(i));
  clarr(i) = cl;
  cdiarr(i) = cdi;
  cdarr(i) = cd;
end

