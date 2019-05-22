function writeexcel (num)

[alfa,cdarr,cdiarr,clarr] = loadvars (num);

matrix = [alfa clarr cdiarr cdarr];

cellarr = {'alfa' 'CL' 'CDi' 'CD'};
cellarr = [cellarr;num2cell(matrix)];

excelname = sprintf('case%d_data.xlsx',num);
xlswrite(excelname,cellarr);

end