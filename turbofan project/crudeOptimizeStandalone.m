clc;clear;close all

caseNum = 76;
design = 'both'; % takeoff,cruise,both
takeoffBlend = 0.1;
cruiseBlend = 0.9;
nozzleMix = true;


% set optimization computational load parameters
varres = 3;
numiter = 20;

% set absolute limit for input variables
B_abs_lim = [0 12];
b_abs_lim = [0 0.12];
Prc_abs_lim = [5 30];
Prf_abs_lim = [1.4 2];

% generate first iteration's test cases
Barr = linspace(B_abs_lim(1),B_abs_lim(2),varres);
barr = linspace(b_abs_lim(1),b_abs_lim(2),varres);
Prcarr = linspace(Prc_abs_lim(1),Prc_abs_lim(2),varres);
Prfarr = linspace(Prf_abs_lim(1),Prf_abs_lim(2),varres);

% initialize some loop parameters
input_history = [];
output_history = [];
optvar = 0;
max_optvar = -inf;
n = 0;
threshold = 1e-16;

while true
  disp(n);
  % run through every combination of test cases and find optimal
  for Bi = 1:varres
    B = Barr(Bi);
    for bi = 1:varres
      b = barr(bi);
      for Prci = 1:varres
        Prc = Prcarr(Prci);
        for Prfi = 1:varres
          Prf = Prfarr(Prfi);
          
          switch design
            case 'takeoff'
              takeoff = true;
              turbofan;
              optvar = Tpermdotaeff;
            case 'cruise'
              takeoff = false;
              turbofan;
              optvar = itaeff*Tpermdotaeff/TSFCeff;
            case 'both'
              takeoff = true;
              turbofan;
              optvar1 = Tpermdotaeff*itaqeff/TSFCeff;
              takeoff = false;
              turbofan;
              optvar2 = Tpermdotaeff*itaeff/TSFCeff;
              optvar = optvar1^takeoffBlend*optvar2^cruiseBlend;
          end
          if optvar >= max_optvar
            max_optvar = optvar;
            B_max_ind = Bi;
            b_max_ind = bi;
            Prc_max_ind = Prci;
            Prf_max_ind = Prfi;
            input_history = [input_history;B b Prc Prf];
            output_history = [output_history;Tpermdotaeff itaqeff itaeff TSFCeff];
            disp([Tpermdotaeff itaqeff itaeff TSFCeff]);
            displayValues;
            pause(0.01);
          end
        end
      end
    end
  end
  
  [Barr] = produceNewVec(Barr,B_max_ind,varres,B_abs_lim);
  [barr] = produceNewVec(barr,b_max_ind,varres,b_abs_lim);
  [Prcarr] = produceNewVec(Prcarr,Prc_max_ind,varres,Prc_abs_lim);
  [Prfarr] = produceNewVec(Prfarr,Prf_max_ind,varres,Prf_abs_lim);
  
  disp(max_optvar)
  if size(output_history,1)>=10
  PerformanceResidual = max(max(abs(diff(output_history(end-5:end,:),1,1))));
    disp(PerformanceResidual)
  if PerformanceResidual<threshold
    fprintf('\nPerformance parameters have converged to double accuracy at n = %d',n);
    break;
  end
  end



  n = n+1;
end








