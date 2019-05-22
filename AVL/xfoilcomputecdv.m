function cdv = xfoilcomputecdv (cli)
  
  setxfoilcli(cli,'xfoil.inp');

  wd = fileparts(which(mfilename));
  cmd = sprintf('cd %s && xfoil.exe < xfoil.inp > xfoil.out',wd);
  [~,~] = system(cmd);
  
  cdv = readcdv ('xfoil.out');
  
end