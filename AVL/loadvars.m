function [alfa,cdarr,cdiarr,clarr] = loadvars (num)
alfaname = sprintf('alfa_case%d.mat',num);
clname = sprintf('clarr_case%d.mat',num);
cdiname = sprintf('cdiarr_case%d.mat',num);
cdname = sprintf('cdarr_case%d.mat',num);

alfa = load(alfaname);
cdarr = load(cdname);
cdiarr = load(cdiname);
clarr = load(clname);
alfa = [alfa.alfa]';
cdarr = [cdarr.cdarr]';
cdiarr = [cdiarr.cdiarr]';
clarr = [clarr.clarr]';
end