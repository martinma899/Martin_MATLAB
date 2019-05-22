% let's first try using a continuous method and manually step it. Guess
% where it would cross zero. 
A = 1; %let's try 1 first
% initialize t and y

tuntil = 0;
tstart = 0;
y1ini = 0;
y2ini = A;
y = [y1ini y2ini];
t = [0];

hold on
plot(t,y(end,1),'b.');
plot([0 tuntil],[0 0],'k-');
legend('y solution');

if A>0
    solver = 1;
elseif A<0
    solver = 2;
end

options = odeset('RelTol',1e-7,'AbsTol',1e-7);

y1arrnumerical = [];
y1arrinterp = [];
y2arrnumerical = [];
y2arrinterp = [];
tarrnumerical = [];
tarrinterp = [];

while true
    % look at the plot produced from last iteration
    disp('look at the plot')
    % linear interpolation of last two points if there are two
    if length(t) > 1
         tzero = -y(end,1)/y(end,2)+t(end);
    end
    % ask if display linear interpolation
    linearinterpbool = input('display linear interpolation prediction? (true or false) \n');
    if linearinterpbool
        plot([t(end),tzero],[y(end,1),0],'r-');
        fprintf('Linear prediction gives the function is about to cross y axis at %f \n'...
            ,tzero)
    end
    % ask if swap solver
    fprintf('current solver: %d \n',solver)
    swapsolverbool = input('swap solver? (true or false) \n');
    % if true
    if swapsolverbool
        % emphasize the interpolated part on plot
        plot([t(end) tzero],[y(end,1),0],'m-')
        % swap solver
        switch solver
            case 1
                solver = 2;
            case 2
                solver = 1;
        end
        fprintf('solver swapped to %d \n',solver)
        % reset tstart and 
        tstart = tzero;
        y2cross = interp1(t(end-5:end),y(end-5:end,2),tzero,'pchip','extrap');
        y2ini = y2cross;
        fprintf('new initial condition: t = %f , y = 0, y'' = %f \n',tzero,y2cross)
        % store old data
        y1arrnumerical = [y1arrnumerical {y(:,1)}];
        y2arrnumerical = [y2arrnumerical {y(:,2)}];
        tarrnumerical = [tarrnumerical {t}];
        y1arrinterp = [y1arrinterp {[y(end,1);0]}];
        y2arrinterp = [y2arrinterp {[y(end,2);y2cross]}];
        tarrinterp = [tarrinterp {[t(end);tzero]}];
        fprintf('data of last half period stored \n')
    end
    tuntil = input('enter a new t we''re goint to integrate to \n');
    switch solver
        case 1
            [t,y] = ode45(@fun1,[tstart tuntil],[y1ini y2ini],options);
        case 2
            [t,y] = ode45(@fun2,[tstart tuntil],[y1ini y2ini],options);
    end
    % finally we need to plot
    close all
    hold on
    plot(t,y(:,1),'b.');
    plot([0 tuntil],[0 0],'k-');
    if numel(y1arrnumerical) ~= 0
        for i = 1:numel(y1arrnumerical)
            plot(tarrnumerical{i},y1arrnumerical{i},'b.');
            plot(tarrinterp{i},y1arrinterp{i},'m-');
        end
    end
end




