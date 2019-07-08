clear
% weapon stats
CC = 0.1;
ECC = 0.0; 
CM = 2.0;
d = 1;
MMT = 17.5; 

CritMulti.x = [CM,1];
CritMulti.p = [CC,1-CC];

Multishotf.x = [1,0]; % multishot fixed distribution
Multishotf.p = [1,0]; 

Multishotr.x = [1,0]; % multishot random distribution
Multishotr.p = [MMT-floor(MMT), 1-(MMT-floor(MMT))];

CritEnhance.x = [CM,0]; % crit enhancement distribution
CritEnhance.p = [ECC,1-ECC]; 

% create the full fixed shots distribution

% first, crit multi x projectile number
CritMulti_f = combineDistribution(CritMulti,Multishotf,'multiply',1);
CritMulti_r = combineDistribution(CritMulti,Multishotr,'multiply',1);

% second, crit multi x projectile number + crit enhancement
% split the distributions into on crit and off crit
CritMulti_f_oncrit.x = CritMulti_f.x(CritMulti_f.x>1);
CritMulti_f_oncrit.p = CritMulti_f.p(CritMulti_f.x>1);
CritMulti_f_offcrit.x = CritMulti_f.x(CritMulti_f.x<=1);
CritMulti_f_offcrit.p = CritMulti_f.p(CritMulti_f.x<=1);

CritMulti_r_oncrit.x = CritMulti_r.x(CritMulti_r.x>1);
CritMulti_r_oncrit.p = CritMulti_r.p(CritMulti_r.x>1);
CritMulti_r_offcrit.x = CritMulti_r.x(CritMulti_r.x<=1);
CritMulti_r_offcrit.p = CritMulti_r.p(CritMulti_r.x<=1);

CritMulti_f_oncrit = combineDistribution(CritMulti_f_oncrit,CritEnhance,'add',1);
CritMulti_r_oncrit = combineDistribution(CritMulti_r_oncrit,CritEnhance,'add',1);

f.x = [CritMulti_f_oncrit.x CritMulti_f_offcrit.x];
f.p = [CritMulti_f_oncrit.p CritMulti_f_offcrit.p];

r.x = [CritMulti_r_oncrit.x CritMulti_r_offcrit.x];
r.p = [CritMulti_r_oncrit.p CritMulti_r_offcrit.p];

temp = f;
for i = 2:floor(MMT)
  temp = combineDistribution(temp,f,'add',1);
end
if (MMT-floor(MMT))>0
  final = combineDistribution(temp,r,'add',1);
elseif (MMT-floor(MMT))==0
  final = temp;
end

final.x = final.x*d;
[final.x,ind] = sort(final.x,'descend');
final.p = final.p(ind);
mew_single = dot(final.x,final.p)
std_single = sqrt(dot((final.x-mew_single).^2,final.p))

numshots = 10;
dps = final;
if numshots>1
for i = 2:numshots
  disp(i)
  dps = combineDistribution(dps,final,'add',1);
end
end

dps.x = dps.x/numshots;
mew_multi = dot(dps.x,dps.p)
std_multi = sqrt(dot((dps.x-mew_multi).^2,dps.p))

plot(dps.x,dps.p,'r.')

