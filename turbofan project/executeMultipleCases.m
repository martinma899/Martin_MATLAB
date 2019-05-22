clc;clear;close all
[~,~,data] = xlsread('cases.xlsx');
data(1,:) = [];
data = data(8,:);
for i = 1:size(data,1)
  % read setup condition for this case
  con = data(i,:);
  caseNum = con{1};
  nozzleMix = strcmp(con{2},'mixed');
  B_abs_lim = [con{3} con{4}];
  b_abs_lim = [con{5} con{6}];
  Prc_abs_lim = [con{7} con{8}];
  Prf_abs_lim = [con{9} con{10}];
  design = con{11};
  takeoffBlend = con{12};
  cruiseBlend = con{13};
  
  % display info about this case
  fprintf('Case number: %d\n',caseNum);
  fprintf('Nozzle: %s\n',con{2});
  fprintf('B limit: [%s]\n',num2str(B_abs_lim));
  fprintf('b limit: [%s]\n',num2str(b_abs_lim));
  fprintf('Prc limit: [%s]\n',num2str(Prc_abs_lim));
  fprintf('Prf limit: [%s]\n',num2str(Prf_abs_lim));
  fprintf('Optimization goal: %s\n',design);
  if strcmp(design,'both')
    fprintf('Takeoff/cruise optimize blend: \n%0.2g takeoff vs %0.2g cruise\n'...
      ,takeoffBlend,cruiseBlend);
  end
  
  % perform optimization
  crudeOptimize;
  
  % Re-analyze the optimal engine design and record results
  B = input_history(end,1);
  b = input_history(end,2);
  Prc = input_history(end,3);
  Prf = input_history(end,4);
  takeoff = true;
  turbofan;
  writeHistoryXlsx;
  takeoff = false;
  turbofan;
  writeHistoryXlsx;
  fprintf('\nResults recorded.\n\n');
  
end





















