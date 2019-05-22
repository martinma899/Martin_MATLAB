[~,~,data2] = xlsread('designs2.xlsx');
if nozzleMix
  nozzleDesign = 'mixed';
else
  nozzleDesign = 'separate';
end
if takeoff
  operatingCondition = 'takeoff';
else
  operatingCondition = 'cruise';
end
lastLine = {caseNum B b Prc Prf nozzleDesign operatingCondition design f Tpermdota deltad ...
  Tpermdotaeff TSFC TSFCeff itapeff itaqeff itaeff};
data2 = [data2;lastLine];
xlswrite('designs2.xlsx',data2);