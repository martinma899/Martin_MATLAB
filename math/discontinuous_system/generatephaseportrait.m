win = [-10 10 -5 5];
tend = 8;
Ares = 50;
A = linspace(-3,3,Ares);
A(A==0) = [];
Ares = numel(A);
colorarr = [linspace(1,0,Ares)',zeros(Ares,1),linspace(0,1,Ares)'];
options = odeset('RelTol',1e-5,'AbsTol',1e-5);
legendvec = [];
close all
hold on
ymax = [];
for i = 1:Ares
    fprintf('Iteration %d, total %d \n',i,Ares);
    Athis = A(i);
    plotcolor = colorarr(i,:);
    if Athis>0
        [t,y] = ode45(@fun1,[0 tend],[0 Athis],options);
        y1 = y(:,1);
        y2 = y(:,2);
        meaningless = y1<0;
        meaninglessnumind = find(meaningless);
        if ~isempty(meaninglessnumind)
            y1 = y1(1:meaninglessnumind-1);
            y2 = y2(1:meaninglessnumind-1);
        end
        plot(y1,y2,...
                  'linestyle','-',...
                  'marker','.',...
                  'markersize',4,...
                  'color',plotcolor);
    elseif Athis<0
        [t,y] = ode45(@fun2,[0 tend],[0 Athis],options);
        y1 = y(:,1);
        y2 = y(:,2);
        meaningless = y1>0;
        meaninglessnumind = find(meaningless);
        if ~isempty(meaninglessnumind)
            y1 = y1(1:meaninglessnumind-1);
            y2 = y2(1:meaninglessnumind-1);
        end
        plot(y1,y2,...
                  'linestyle','-',...
                  'marker','.',...
                  'markersize',4,...
                  'color',plotcolor);
    end
    ymax = [ymax max(abs(y1))];
    legendvec = [legendvec {sprintf('A = %f',Athis)}];
end
%legend(legendvec);
axis equal
axis(win)
Asmallerthanzero = A<0;
A(Asmallerthanzero) = [];
ymax(Asmallerthanzero) = [];
[~,changeindex] = max(diff(ymax));
fprintf('The predicted change of behavior occurs between A = %f and A = %f'...
    ,A(changeindex),A(changeindex+1))

