
% P_Color = [0 0 1];
% T_Color = [1 0 0];
% B_Color = [0 0 0];
% 
% labelsBool = true;

if nozzleMix
  figure(1)
  hold on
  coreTstations = [1 2 3 4 5 6 7 8 9 10]';
  coreT = [Ta T02 T03 T04 T05 T06 T07 T08 T09 T10]';
  plot(coreTstations,coreT,'Color',T_Color,'Marker','s')
  
  bypassTStations = [1 2 3 8 9 10]';
  bypassT = [Ta T02 T03 T03 T09 T10]';
  plot(bypassTStations,bypassT,'Color',B_Color,'Marker','s');
  
  if labelsBool
    coreTNamesArr = {' Ta' ' T02' ' T03' ' T04' ' T05' ' T06' ' T07' ' T08' ' T09' ' T10'};
    text(coreTstations,coreT,coreTNamesArr)
  end
  
  xlabel('station number')
  ylabel('Temperature / K')
  
  %   adiabaticTStations = [2 3 4 6 8 10];
  %   adiabaticT = [T02s T03s T04s T06s T08s T10s];
  %   plot(adiabaticTStations,adiabaticT,'ms');
  
  figure(2)
  hold on
  corePstations = [1 2 3 4 5 6 7 8 9 10]';
  coreP = [Pa P02 P03 P04 P05 P06 P07 P08 P09 Pa]/1000';
  semilogy(corePstations,coreP,'Color',P_Color,'Marker','s');
  
  bypassPstatios = [1 2 3 8 9 10];
  bypassP = [Pa P02 P03 P03 P09 Pa]/1000;
  semilogy(bypassPstatios,bypassP,'Color',B_Color,'Marker','s')
  
  if labelsBool
    corePNamesArr = {' Pa' ' P02' ' P03' ' P04' ' P05' ' P06' ' P07' ' P08' ' P09' ' Pa'};
    text(corePstations,coreP,corePNamesArr)
  end
  
  xlabel('station number')
  ylabel('Pressure / kPa')
else
  figure(1)
  hold on
  coreTstations = [1 2 3 4 5 6 7 8 9]';
  coreT = [Ta T02 T03 T04 T05 T06 T07 T08 T9]';
  plot(coreTstations,coreT,'rs-')
  
  bypassTStations = [1 2 3 10]';
  bypassT = [Ta T02 T03 T10]';
  plot(bypassTStations,bypassT,'ks-');
  
  adiabaticTStations = [2 3 4 6 8 9 10];
  adiabaticT = [T02s T03s T04s T06s T08s T9s T10s];
  plot(adiabaticTStations,adiabaticT,'ms');
  
  figure(2)
  hold on
  corePstations = [1 2 3 4 5 6 7 8 9]';
  coreP = [Pa P02 P03 P04 P05 P06 P07 P08 Pa]';
  semilogy(corePstations,coreP,'bs-');
  
  bypassPstatios = [1 2 3 10];
  bypassP = [Pa P02 P03 Pa];
  semilogy(bypassPstatios,bypassP,'ks-')
end