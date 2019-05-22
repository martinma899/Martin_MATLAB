function [cl,cdi,cd] = avl(filename,alfa)

% clear output file
fidout = fopen('avl.out','w');
fclose(fidout);

% set configuration file name in avl.inp
setavlinp('avl.inp',filename);
% set angle of attack in configuration file
%setalfa(alfa,filename);
setalfaalt(alfa,filename);

% compute inviscid cl and cd
wd = fileparts(which(mfilename));
cmd = sprintf('cd %s && avl.exe < avl.inp > avl.out',wd);
[~,~] = system(cmd);

% retrieve values from dump.txt
[cl,cdi,cliarr,sarr] = getdata ('avldump.txt');

% use xfoil to find cdv for every cli
cdvarr = [];
for i = 1:numel(cliarr)
  cli = cliarr(i);
  cdvarr = [cdvarr;xfoilcomputecdv(cli)];
end

cdv = sum(cdvarr.*sarr)/sum(sarr);
cd = cdi+cdv;

fclose('all');

end
