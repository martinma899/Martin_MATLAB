% DO NOT CHANGE THIS LINE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [xlsNum,xlsText,xlsRaw] = ABCs_HighLevelFileIO(xls1, xls2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ABCs of High Level File I/O
%
%
% Directions:
% Write the code to satisify the following directions. For each part, store
% your answer in the variable that is specified within the parentheses. 
%   Ex. Add 1 + 1. (GT)
% That means store the value of 1 + 1 in the variable GT. 
%
% Given Input Variables:
%   1. xls1 - Given excel (.xls) file 
%   2. xls2 - .xls file name to write to
% Note: All files input variables will be in the format  
% i.e.: xls1 = 'file.xls'
%
%
% A) Reading an Excel worksheet. Read in an Excel file whose filename is
% given as an input to this function in xls1.  Store the resultant outputs
% in (xlsNum), (xlsText), and (xlsRaw).
 [xlsNum,xlsText,xlsRaw] = xlsread(xls1);

% B) Writing Excel files. Write the xlsText data to xls2.
 xlswrite(xls2,xlsRaw);


end
