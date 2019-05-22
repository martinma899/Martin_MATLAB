function xfoil
  clc;clear;fclose('all');close all% house keeping
  wd = fileparts(which(mfilename));% get working directory
  % fid = fopen('xfoil.inp','r');% initialize input command file
  % fid2 = fopen('xfoil.out','w');% initialize output file
  % fclose('all')
  
  % write needed commands to input file
  % fprintf(fid,'');
  
  % execute xfoil with input command file
  cmd = sprintf('cd %s && xfoil.exe < xfoil.inp > xfoil.out',wd)
  [status,result] = system(cmd);
  
  
end