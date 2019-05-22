%% house keeping
clc;clear;close all

% first read input file
% coords starts and ends with the same point. remember.

% fname = 'RAE2822_4001.geom';
% fname = 'RAE2822.geom';
% fname = 's1091.dat';
% fname = 'eppler376.dat';
% fname = 'naca0012.dat';
% fname = 'naca2412.dat';
% fname = 'naca23012.dat';
% fname = 'nacasc(2)-0612.dat';
% fname = 'nacasc(2)-0612_good.dat';
% fname = 'fx79w151a.dat';
% fname = 'ONERAHOR07.dat';
 fname = 'MH112.dat';
% fname = 'GIIIBL0.dat';

coords = readGeomFile(fname);
coords(end,:) = [];
x = coords(:,1);
y = coords(:,2);
l = numel(x);

%% compute panel lengths

panelLengths = zeros(l,1);
for i = 1:l
  B = [x(i);y(i)];
  if i == l
    C = [x(1);y(1)];
  else
    C = [x(i+1);y(i+1)];
  end
  panelLength = norm(C-B);
  panelLengths(i) = panelLength;
end

temp = [panelLengths(end);panelLengths(1:(end-1))];
avgPanelLengths = 0.5*(temp+panelLengths);

%% Compute Curvature method 1
% circle method with singularity identification algorithm
% If system unsolvable, then automatically include neighbor points
% until the least square system is solvable or completely linear

stepbystep = false;
threshold = 1e-18;
threshold2 = 1e-20;
kappaarr_method1 = zeros(l,1);

for i = 1:l
  Aind = i-1;
  Bind = i;
  Cind = i+1;
  if Aind<1
    Aind = l;
  end
  if Cind>l
    Cind = 1;
  end
  Lind = Aind;
  Rind = Cind;
  A = [x(Aind) y(Aind)];
  B = [x(Bind) y(Bind)];
  C = [x(Cind) y(Cind)];
  sample = [A;B;C];
  determinant = abs(det([(B-A);(C-B)]));
  n = 0;
  while true
    if abs(determinant)>threshold
      [O,r,kappa] = solveForCurvature (sample);
      break
    end
    panelDistProd = norm(B-A)*norm(C-B);
    sintheta = determinant/panelDistProd;
    if sintheta<=threshold2
      kappa = 0;
      break
    end
    if sintheta<=threshold2
      firstTrigger = false;
    end
    n=n+1;
    Aind = Aind-1;
    Cind = Cind+1;
    if Aind<1
      Aind = l;
    end
    if Cind>l
      Cind = 1;
    end
    A = [x(Aind) y(Aind)];
    C = [x(Cind) y(Cind)];
    sample = [A;sample;C];
    determinant = abs(det(diff(sample,1)'*diff(sample,1)));
  end
  
  fprintf('Node %d. Searched %d neighbor panels. k = %1.6f\n',i,n,kappa);
  kappaarr_method1(i) = kappa;
  if stepbystep
    clf;
    plot(coords(:,1),coords(:,2),'b.-');
    hold on
    
    % plot O and see if it makes sense
    plot(O(1),O(2),'bo');
    
    % draw the "Tangent" circle
    circle(O,r);
    axis([O(1)-r*1.25 O(1)+r*1.25 O(2)-r*1.25 O(2)+r*1.25])
    axis equal
  end
end

%% Compute Curvature Method 2
% circle least square fit through a changeable size of neighborhood

stepbystep = 0;
kappaarr_method2 = zeros(l,1);
numNeighbor = 2; % supposed to be >= 2

for i = 1:l
  sample = [x(i) y(i)];
  Lind = i; Rind = i;
  for j = 1:numNeighbor
    Lind = Lind-1;
    Rind = Rind+1;
    if Lind<1
      Lind = l;
    end
    if Rind>l
      Rind = 1;
    end
    sample = [x(Lind) y(Lind);sample;x(Rind) y(Rind)];
  end
  [O,r,kappa] = solveForCurvature (sample);
  kappaarr_method2(i) = kappa;
  
  if stepbystep
    clf;
    plot(coords(:,1),coords(:,2),'b.-');
    hold on
    
    plot(sample(:,1),sample(:,2),'ro')
    % plot O and see if it makes sense
    plot(O(1),O(2),'bo');
    
    % draw the "Tangent" circle
    circle(O,r);
    axis([O(1)-r*1.25 O(1)+r*1.25 O(2)-r*1.25 O(2)+r*1.25])
    axis square
  end
end


%% Compute Curvature Method 3
% bezier quadratic curve fit method
% fit bezier quadratic curve through the node of interest
% and two nearest neighbors
% t value is panel distance weighted
% curvature computed with 2D curve formula

stepbystep = false;
tlist = linspace(0,1,101);
kappaarr_method3 = zeros(l,1);

for i = 1:l
  Aind = i-1;
  Bind = i;
  Cind = i+1;
  if Aind<1
    Aind = l;
  end
  if Cind>l
    Cind = 1;
  end
  A = [x(Aind);y(Aind)];
  B = [x(Bind);y(Bind)];
  C = [x(Cind);y(Cind)];
  
  t = norm(B-A)/(norm(B-A)+norm(C-B));
  Px1 = (B(1)-A(1)*(1-t)^2-C(1)*t^2)/(2*(1-t)*t);
  Py1 = (B(2)-A(2)*(1-t)^2-C(2)*t^2)/(2*(1-t)*t);
  
  B2x_1 = -2*A(1)*(1-t)+2*Px1*(-2*t+1)+2*C(1)*t;
  B2y_1 = -2*A(2)*(1-t)+2*Py1*(-2*t+1)+2*C(2)*t;
  B2x_2 = 2*A(1)-4*Px1+2*C(1);
  B2y_2 = 2*A(2)-4*Py1+2*C(2);
  
  numerator = abs(B2x_1*B2y_2-B2y_1*B2x_2);
  denominator = abs((B2x_1^2+B2y_1^2)^(3/2));
  kappa = numerator/denominator;
  
  %fprintf('kappa = %1.6f num = %1.6f den = %1.6e t = %0.3f\n',kappa,numerator,denominator,t);
  
  kappaarr_method3(i) = kappa;
  
  if stepbystep
    clf;
    plot(coords(:,1),coords(:,2),'b.-');
    hold on
    
    plot([A(1) B(1) C(1)],[A(2) B(2) C(2)],'ro');
    
    B2x = A(1)*(1-tlist).^2+2*Px1*(1-tlist).*tlist+C(1)*tlist.^2;
    B2y = A(2)*(1-tlist).^2+2*Py1*(1-tlist).*tlist+C(2)*tlist.^2;
    
    xmax = max(B2x);
    xmin = min(B2x);
    ymax = max(B2y);
    ymin = min(B2y);
    
    L = xmax-xmin;
    H = ymax-ymin;
    
    if L>H
      H = L;
    else
      L = H;
    end
    
    xmid = (xmax+xmin)/2;
    ymid = (ymax+ymin)/2;
    
    wind = [xmid-L xmid+L ymid-H ymid+H];
    plot(B2x,B2y,'r-');
    axis equal
    axis(wind);
    
  end
end

%% Compute Curvature Method 4
% any order bezier curve fitted over any width of interval
% number of points selected - 2 >= order of curve - 1
% if equal to, then directly solve system
% else, least square the system

stepbystep = 1;
kappaarr_method4 = zeros(l,1);
numNeighbor = 2; % sample 4 neighbors
n = 3; % least square 4th order bezier curve
% check algorithm
numData = numNeighbor*2+1-2;
numControl = n-1;
if numData < numControl
  error('Order of bezier curve too high');
end

for i = 1:l
  % first pick out our sample interval
  intervalIndArr = i;
  Lind = i; Rind = i;
  for j = 1:numNeighbor
    Lind = Lind-1;
    Rind = Rind+1;
    if Lind<1
      Lind = l;
    end
    if Rind>l
      Rind = 1;
    end
    intervalIndArr = [Lind intervalIndArr Rind];
  end
  sample = [x(intervalIndArr) y(intervalIndArr)];
  % then compute t values, excluding ends which we know are 0 and 1,
  % based on panel lengths. 
  
  % picking out n points, there will be n-1 panels associated.
  localPanelLengths = panelLengths(intervalIndArr(1:end-1));
  totalLocalLength = sum(localPanelLengths);
  tarr = cumsum(localPanelLengths(1:end-1))/totalLocalLength;
  
  % construct A and b for x values
  A = zeros(numel(tarr),n-1);
  b = zeros(numel(tarr),1);
  for j = 1:numel(tarr)
    Arow = zeros(1,n-1);
    thist = tarr(j);
    for k = 1:(n-1)
      Arow(k) = nchoosek(n,k)*(1-thist)^(n-k)*thist^k;
    end
    A(j,:) = Arow;
    b(j) = sample(j+1,1)-sample(1,1)*(1-thist)^n-sample(end,1)*thist^n;
  end
  
  Px = (A'*A)\(A'*b);
  % include beginning and end points in weights
  Px = [sample(1,1);Px;sample(end,1)];
  
  % construct A and b for y values
  A = zeros(numel(tarr),n-1);
  b = zeros(numel(tarr),1);
  for j = 1:numel(tarr)
    Arow = zeros(1,n-1);
    thist = tarr(j);
    for k = 1:(n-1)
      Arow(k) = nchoosek(n,k)*(1-thist)^(n-k)*thist^k;
    end
    A(j,:) = Arow;
    b(j) = sample(j+1,2)-sample(1,2)*(1-thist)^n-sample(end,2)*thist^n;
  end
  
  Py = (A'*A)\(A'*b);
  % include beginning and end points in weights
  Py = [sample(1,2);Py;sample(end,2)];
  
  % now compute x', x'', y', y''
  
  tc = tarr(numNeighbor); % center t value with which we compute curvature
  
  x_1 = 0;
  y_1 = 0;
  for k = 0:n
    x_1 = x_1+Px(k+1)*nchoosek(n,k)*...
      (k*tc^(k-1)*(1-tc)^(n-k)+(k-n)*tc^k*(1-tc)^(n-k-1));
    y_1 = y_1+Py(k+1)*nchoosek(n,k)*...
      (k*tc^(k-1)*(1-tc)^(n-k)+(k-n)*tc^k*(1-tc)^(n-k-1));
  end
  x_2 = 0;
  y_2 = 0;
  for k = 0:n
    x_2 = x_2+Px(k+1)*nchoosek(n,k)*...
    ( k*( (k-1)*tc^(k-2)*(1-tc)^(n-k) - tc^(k-1)*(n-k)*(1-tc)^(n-k-1) ) + ...
      (k-n)*( k*tc^(k-1)*(1-tc)^(n-k-1) - tc^k*(n-k-1)*(1-tc)^(n-k-2) )...
    );
    y_2 = y_2+Py(k+1)*nchoosek(n,k)*...
    ( k*( (k-1)*tc^(k-2)*(1-tc)^(n-k) - tc^(k-1)*(n-k)*(1-tc)^(n-k-1) ) + ...
      (k-n)*( k*tc^(k-1)*(1-tc)^(n-k-1) - tc^k*(n-k-1)*(1-tc)^(n-k-2) )...
    );
  end
  
  numerator = abs(x_1*y_2-y_1*x_2);
  denominator = abs(((x_1^2+y_1^2)^(3/2)));
  kappa = numerator/denominator;
  
  fprintf('kappa = %1.6f num = %1.6f den = %1.6e t = %0.3f\n',kappa,numerator,denominator,tc);
  
  kappaarr_method4(i) = kappa;
  
  if stepbystep
    clf;
    plot(coords(:,1),coords(:,2),'b.-');
    hold on
    plot(sample(:,1),sample(:,2),'ro');
    plot([sample(1,1);Px;sample(end,1)],...
         [sample(1,2);Py;sample(end,2)],'b^--');
    
    Bx = zeros(1,101);
    By = zeros(1,101);
    
    for k = 0:n
      Bx = Bx+Px(k+1)*nchoosek(n,k)*(1-tlist).^(n-k).*tlist.^k;
      By = By+Py(k+1)*nchoosek(n,k)*(1-tlist).^(n-k).*tlist.^k;
    end
    
    Bxc = 0;
    Byc = 0;
    
    for k = 0:n
      Bxc = Bxc+Px(k+1)*nchoosek(n,k)*(1-tc).^(n-k).*tc.^k;
      Byc = Byc+Py(k+1)*nchoosek(n,k)*(1-tc).^(n-k).*tc.^k;
    end
    
    xmax = max(Bx);
    xmin = min(Bx);
    ymax = max(By);
    ymin = min(By);
    
    L = xmax-xmin;
    H = ymax-ymin;
    
    if L>H
      H = L;
    else
      L = H;
    end
    
    xmid = (xmax+xmin)/2;
    ymid = (ymax+ymin)/2;
    
    wind = [xmid-L xmid+L ymid-H ymid+H];
    plot(Bx,By,'r-');
    plot(Bxc,Byc,'r^');
    axis equal
    axis(wind);
  end
  
end

%% smooth curvature

% span = ceil(length(coords)/20);
% if ~logical(mod(span,2))
%   span = span+1;
% end
% if span<5
%   span = 5;
% end
span = 7; % don't change this for IQR purposes
halfSpan = (span-1)/2;
robust = false;
kappareg = [];
limiting = 1;

for i = 1:l
  [v,vy,indVec] = generate_v_and_vy(i,kappaarr_method1,panelLengths,halfSpan,l);
  
  % try eliminating outlier data points
  switch limiting
    case 1
      MAD1 = median(vy);
      zscores = abs(vy-MAD1)/std(vy);
      outlierInd = zscores >= 2;
      if sum(outlierInd)>=1
        %fprintf('i = %d, %d outlier(s) suppressed.\n',i,sum(outlierInd));
        %disp([vy',zscores'])
      end
      v(outlierInd) = [];
      vy(outlierInd) = [];
    case 2
      vys = sort(vy,'ascend');
      Q1 = vys(2);
      Q3 = vys(6);
      IQR = Q3-Q1;
      outlierInd = vy>(Q3+1.5*IQR)&vy<(Q1-1.5*IQR);
      v(outlierInd) = [];
      vy(outlierInd) = [];
  end
  thisx = 0;
  d = max(abs(thisx-v(1)),abs(thisx-v(end)));
  w = (1-abs((v-thisx)/d).^3).^3;
  W = diag(sqrt(w));
  A = W*[v' ones(length(v),1)];
  b = W*vy';
  coeffs = (A'*A)\(A'*b);
  
  if robust
    rs = coeffs(1)*v+coeffs(2)-vy;
    MAD = median(abs(rs));
    
    w = (1-(rs./(6*MAD)).^2).^2;
    w(abs(rs)>=(6*MAD)) = 0;
    W = diag(sqrt(w));
    A = W*[v' ones(span,1)];
    b = W*vy';
    coeffs = inv(A'*A)*(A'*b);
  end
  
  kappareg = [kappareg;coeffs(1)*thisx+coeffs(2)];
end

%% plot curvature

figure(2)
logbool = true;
%subplot(2,1,1);
if logbool
  semilogy(coords(:,1),kappaarr_method1,'rx-');
  hold on
  semilogy(coords(:,1),kappaarr_method2,'m^-');
  semilogy(coords(:,1),kappaarr_method4,'ks-');
  %semilogy(coords(:,1),kappareg,'b.-');
else
  plot(coords(:,1),kappaarr_method1,'r.-');
  hold on
  plot(coords(:,1),kappareg,'b.-');
end
legend('Raw circle','Raw circle 2','High Order Bezier')
xlabel('x/c')
ylabel('kappa')

%% sharp node identification methods

% subplot(2,1,2)
% hist(zscores,1000)
% xlabel('z score of kappa for every node')
% ylabel('frequency')

% identify sharp nodes by picking a certain percent
% of sharpest nodes
thresholdPercent = 0.1;
[~,kappaIndex] = sort(kappaarr_method1,'descend');
numSharpNodes = ceil(l*(thresholdPercent));
sharpNodeIndex = kappaIndex(1:numSharpNodes);
roughCoords = coords(sharpNodeIndex,:);

% identifying sharp nodes by picking nodes with curvature
% z score above or equal to a fixed threshold
zscores = (kappaarr_method1-median(kappaarr_method1))/std(kappaarr_method1);
zscoreCutoff = 0.3;
[zscoresSorted,zscoreSortInd] = sort(zscores,'descend');
highZscoreInd = [];
n = 0;
while true
  n = n+1;
  thisZscoreInd = zscoreSortInd(n);
  thisZscore = zscores(thisZscoreInd);
  if thisZscore>=zscoreCutoff
    highZscoreInd = [highZscoreInd;thisZscoreInd];
  else
    break
  end
end
roughCoords2 = coords(highZscoreInd,:);


% identifying sharp nodes by going down the list of nodes
% from highest curvature to lowest curvature
% summing up the nodes' average panel lengths
% until the total panel lengths exceed a threshold
% of, say, 10% of total panel length
lengthThreshold = 0.02;
curvedLength = sum(panelLengths)*lengthThreshold;
totalLength = 0;
n = 0;
while true
  n = n+1;
  thisKappaIndex = kappaIndex(n);
  thisPanelLength = avgPanelLengths(thisKappaIndex);
  totalLength = totalLength+thisPanelLength;
  if totalLength>=curvedLength
    break
  end
end
numPts = n;
actualPercent = totalLength/sum(panelLengths);
roughCoords3 = coords(kappaIndex(1:n),:);

% running the same z score method,
% but put an upper limit of longest panel length it is allowed to cover.
% use computed results from method 2 and 3
if numel(highZscoreInd)>numPts
  highZscoreIndLimited = highZscoreInd(1:numPts);
  
  disp('Too many points picked from z score; number of sharp nodes limited by total surface length allowed')
else
  highZscoreIndLimited = highZscoreInd;
  disp('Few points picked from z score; number of sharp nodes not limited by total surface length allowed')
end
roughCoords4 = coords(highZscoreIndLimited,:);

%% airfoil plotting

figure(3)

subplot(4,1,1)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords(:,1),roughCoords(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
title('10% of sharpest nodes, round up')

subplot(4,1,2)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords2(:,1),roughCoords2(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
title('z score (around median) greater than 0.3')

subplot(4,1,3)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords3(:,1),roughCoords3(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
str = sprintf('%1.2f%% of surface length, evaluated by average panel length at nodes, round up.',actualPercent*100);
title(str)

subplot(4,1,4)
hold on
plot(coords(:,1),coords(:,2),'b.-');
plot(roughCoords4(:,1),roughCoords4(:,2),'ro');
axis equal
xlabel('x/c')
ylabel('y')
%str = sprintf('%1.2f%% of surface length, evaluated by average panel length at nodes, round up.',actualPercent*100);
title('z score method limited by panel length method')







