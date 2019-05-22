% close all
% figure(3)
clf;
margin = 0.2;
height = 1;
width = 1;
ax = [0 width 0 height];
axisPlot = ax+[0 margin -margin margin];
axis(axisPlot)
axis off

arrsize = [5 25];

x = linspace(0,width,arrsize(1));
y = linspace(height,0,arrsize(2));

[xx,yy] = meshgrid(x,y);

xx = reshape(xx,1,numel(xx));
yy = reshape(yy,1,numel(yy));

strarr = cell(arrsize([2 1]));

strarr{1,1} = 'Gas constant and ratios';
strarr{2,1} = sprintf('R = %0.8g J/(kg-K)',R);
strarr{3,1} = sprintf('r = %0.4g',r);
strarr{4,1} = sprintf('rd = %0.4g',rd);
strarr{5,1} = sprintf('rf = %0.4g',rf);
strarr{6,1} = sprintf('rc = %0.4g',rc);
strarr{7,1} = sprintf('rt = %0.4g',rt);
strarr{8,1} = sprintf('rtm = %0.4g',rtm);
strarr{9,1} = sprintf('rft = %0.4g',rft);
if nozzleMix
  strarr{10,1} = sprintf('rnm = %0.4g',rnm);
  strarr{11,1} = sprintf('rcn = %0.4g',rcn);
else
  strarr{10,1} = sprintf('rn = %0.4g',rn);
  strarr{11,1} = sprintf('rfn = %0.4g',rfn);
end

if takeoff
  strarr{13,1} = 'Ambient Conditions : takeoff';
else
  strarr{13,1} = 'Ambient Conditions : cruise';
end
strarr{14,1} = sprintf('M = %0.4g',M);
strarr{15,1} = sprintf('Ta = %0.4g K',Ta);
strarr{16,1} = sprintf('Pa = %0.5g Pa',Pa);

strarr{18,1} = 'Variable Design Parameters';
strarr{19,1} = sprintf('B = %0.15g',B);
strarr{20,1} = sprintf('b = %0.6g',b);
strarr{21,1} = sprintf('Prc = %0.15g',Prc);
strarr{22,1} = sprintf('Prf = %0.15g',Prf);

if nozzleMix
  strarr{24,1} = 'Mixed Nozzle';
else
  strarr{24,1} = 'Separated Nozzle';
end

strarr{1,2} = 'Fixed Design Parameters';
strarr{2,2} = sprintf('bmax = %0.6g',bmax);
strarr{3,2} = sprintf('Cb1 = %0.6g K',Cb1);
strarr{4,2} = sprintf('Cb2 = %0.6g Pa',Cb2);
strarr{5,2} = sprintf('CB1 = %0.6g N-s/kg',CB1);
strarr{6,2} = sprintf('CB2 = %0.6g',CB2);
strarr{7,2} = sprintf('Tmax0 = %0.6g K',Tmax0);
strarr{8,2} = sprintf('Qr = %0.6g kJ/kg',Qr/1000);
strarr{9,2} = sprintf('Treq = %0.6g N',Treq);

strarr{11,2} = 'Efficiency and Loss';
strarr{12,2} = sprintf('itad = %0.6g',itad);
strarr{13,2} = sprintf('itaf_p = %0.6g',itaf_p);
strarr{14,2} = sprintf('itaf = %0.6g',itaf);
strarr{15,2} = sprintf('itac_p = %0.6g',itac_p);
strarr{16,2} = sprintf('itac = %0.6g',itac);
strarr{17,2} = sprintf('itab = %0.6g',itab);
strarr{18,2} = sprintf('itat_p = %0.6g',itat_p);
strarr{19,2} = sprintf('itat = %0.6g',itat);
strarr{20,2} = sprintf('itaft_p = %0.6g',itaft_p);
strarr{21,2} = sprintf('itaft = %0.6g',itaft);
if nozzleMix
  strarr{22,2} = sprintf('itacn = %0.6g',itacn);
else
  strarr{22,2} = sprintf('itan = %0.6g',itan);
  strarr{23,2} = sprintf('itafn = %0.6g',itafn);
end
strarr{24,2} = sprintf('Prb = %0.6g',Prb);
strarr{25,2} = sprintf('Prm = %0.6g',Prm);
strarr{1,3} = 'Temperatures';
strarr{2,3} = sprintf('T02 = %0.8g K',T02);
strarr{3,3} = sprintf('T03 = %0.8g K',T03);
strarr{4,3} = sprintf('T04 = %0.8g K',T04);
strarr{5,3} = sprintf('T05 = %0.8g K',T05);
strarr{6,3} = sprintf('T06 = %0.8g K',T06);
strarr{7,3} = sprintf('T07 = %0.8g K',T07);
strarr{8,3} = sprintf('T08 = %0.8g K',T08);
if nozzleMix
  strarr{9,3} = sprintf('T09 = %0.8g K',T09);
  strarr{10,3} = sprintf('T10 = %0.8g K',T10);
else
  strarr{9,3} = sprintf('T9 = %0.8g K',T9);
  strarr{10,3} = sprintf('T10 = %0.8g K',T10);
end


strarr{12,3} = 'Pressures';
strarr{13,3} = sprintf('P02 = %0.8g kPa',P02/1000);
strarr{14,3} = sprintf('P03 = %0.8g kPa',P03/1000);
strarr{15,3} = sprintf('P04 = %0.8g kPa',P04/1000);
strarr{16,3} = sprintf('P05 = %0.8g kPa',P05/1000);
strarr{17,3} = sprintf('P06 = %0.8g kPa',P06/1000);
strarr{18,3} = sprintf('P07 = %0.8g kPa',P07/1000);
strarr{19,3} = sprintf('P08 = %0.8g kPa',P08/1000);
if nozzleMix
  strarr{20,3} = sprintf('P09 = %0.8g kPa',P09/1000);
end

strarr{22,3} = 'Velocity';
strarr{23,3} = sprintf('u = %0.8g m/s',u);
strarr{24,3} = sprintf('ue = %0.8g m/s',ue);
if ~nozzleMix
  strarr{25,3} = sprintf('uef= %0.8g m/s',uef);
end
strarr{1,4} = 'Temperature Ratios';
strarr{2,4} = sprintf('T02/Ta = %0.5g',T02overTa);
strarr{3,4} = sprintf('T03/T02 = %0.5g',T03overT02);
strarr{4,4} = sprintf('T04/T03 = %0.5g',T04overT03);
strarr{5,4} = sprintf('T05/T04 = %0.5g',T05overT04);
strarr{6,4} = sprintf('T06/T05 = %0.5g',T06overT05);
strarr{7,4} = sprintf('T07/T06 = %0.5g',T07overT06);
strarr{8,4} = sprintf('T08/T07 = %0.5g',T08overT07);
if nozzleMix
  strarr{9,4} = sprintf('T09/T08 = %0.5g',T09/T08);
  strarr{10,4} = sprintf('T10/T09 = %0.5g',T10overT09);
else
  strarr{9,4} = sprintf('T9/T08 = %0.5g',T9overT08);
  strarr{10,4} = sprintf('T10/T03 = %0.5g',T10overT03);
end

strarr{12,4} = 'Pressure Ratios';
strarr{13,4} = sprintf('P02/Pa = %0.5g',P02overPa);
strarr{14,4} = sprintf('P03/P02 = %0.5g',Prf);
strarr{15,4} = sprintf('P04/P03 = %0.5g',Prc);
strarr{16,4} = sprintf('P05/P04 = %0.5g',Prb);
strarr{17,4} = sprintf('P06/P05 = %0.5g',P06overP05);
strarr{18,4} = sprintf('P07/P06 = %0.5g',P07/P06);
strarr{19,4} = sprintf('P08/P07 = %0.5g',P08overP07);

strarr{1,5} = 'Critical Performance Parameters';
strarr{2,5} = sprintf('f = %0.6g',f);
strarr{3,5} = sprintf('Tpermodota = %0.8g kN/(kg/s)',Tpermdota/1000);
strarr{4,5} = sprintf('Tpermodotaeff = %0.8g kN/(kg/s)',Tpermdotaeff/1000);
strarr{5,5} = sprintf('TSFC = %1.6e kg/(s-kN)',1000*TSFC);
strarr{6,5} = sprintf('TSFCeff = %1.6e kg/(s-kN)',1000*TSFCeff);
strarr{7,5} = sprintf('itap = %0.5g',itap);
strarr{8,5} = sprintf('itaq = %0.5g',itaq);
strarr{9,5} = sprintf('ita = %0.5g',ita);
strarr{10,5} = sprintf('itapeff = %0.5g',itapeff);
strarr{11,5} = sprintf('itaqeff = %0.5g',itaqeff);
strarr{12,5} = sprintf('itaeff = %0.5g',itaeff);


strarr{14,5} = 'Other Performance Parameters';
strarr{15,5} = sprintf('compressor shaft power = %0.8g kJ/kg',PowerComp/1000);
strarr{16,5} = sprintf('fan shaft power = %0.8g kJ/kg',PowerFan/1000);
strarr{17,5} = sprintf('deltad = %0.8g kN/(kg/s)',deltad/1000);
strarr{18,5} = sprintf('mdotareq = %0.8g kg/s',mdotareq);
strarr{19,5} = sprintf('mdottotreq = %0.8g kg/s',mdottotreq);
strarr{20,5} = sprintf('A = %0.4g m^2',Aall);
strarr{21,5} = sprintf('D = %0.4g m',Dall);
strarr{22,5} = sprintf('Prtotal = %0.6g',Prtotal);

for i = 1:numel(strarr)
  str = strarr{i};
  %fprintf('strarr{%d} = sprintf('''',);\n',i)
  if isempty(str)
    % text(xx(i),yy(i),sprintf('--- %d',i))
    text(xx(i),yy(i),' ')
  else
    text(xx(i),yy(i),str)
  end
end





