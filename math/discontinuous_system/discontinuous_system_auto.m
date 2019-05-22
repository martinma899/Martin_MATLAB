% now let's make everything automated. 
% define my A. 
clear
clc
Abound = [-1 1];
Ares = 100;
A = linspace(Abound(1),Abound(2),Ares);
A(A==0) = [];

interptol = 1e-6;
options = odeset('RelTol',1e-6,'AbsTol',1e-6);

T = [];
newtonmethodstep = 0.3;

for i = 1:Ares
    Athis = A(i);
    
% first half
    tstart = 0;
    loopbool = true;
    tuntil = tstart;
    
    y2ini = Athis;
    
    if Athis >0
        solver = 1;
    else 
        solver = 2;
    end
    
    timestepfirsthalf = abs(Athis)/5;
    
    while loopbool
        tuntil = tuntil+timestepfirsthalf;
        switch solver
            case 1
            [t,y] = ode45(@fun1,[tstart tuntil],[0 y2ini],options);
            case 2
            [t,y] = ode45(@fun2,[tstart tuntil],[0 y2ini],options);
        end
        tzero = -y(end,1)/y(end,2)+t(end);
        if tzero-tuntil<0
            loopbool = true;
        else
            if tuntil/tzero<0.8
                loopbool = true;
            else
                loopbool = false;
            end
        end
        plot(t,y(:,1),'b.');
    end
    
    error = tzero-tuntil;
    
    while error>interptol
        tuntil = tuntil+newtonmethodstep*error;
        switch solver
            case 1
            [t,y] = ode45(@fun1,[tstart tuntil],[0 y2ini],options);
            case 2
            [t,y] = ode45(@fun2,[tstart tuntil],[0 y2ini],options);
        end
        tzero = -y(end,1)/y(end,2)+t(end);
        error = tzero-tuntil;
        plot(t,y(:,1),'r.');
    end
    
% second half
    tstart = tzero;
    loopbool = true;
    tuntil = tstart;
    
    y2ini = interp1(t(end-5:end),y(end-5:end,2),tzero,'pchip','extrap');
    
    switch solver
        case 1
            solver = 2;
        case 2
            solver = 1;
    end
    
    while loopbool
        tuntil = tuntil+timestepfirsthalf;
        switch solver
            case 1
            [t,y] = ode45(@fun1,[tstart tuntil],[0 y2ini],options);
            case 2
            [t,y] = ode45(@fun2,[tstart tuntil],[0 y2ini],options);
        end
        tzero = -y(end,1)/y(end,2)+t(end);
                if tzero-tuntil<0
            loopbool = true;
        else
            if (tuntil-tstart)/(tzero-tstart)<0.8
                loopbool = true;
            else
                loopbool = false;
            end
                end
        plot(t,y(:,1),'b.');
    end
    
    error = tzero-tuntil;
    
    while error>interptol
        tuntil = tuntil+newtonmethodstep*error;
        switch solver
            case 1
            [t,y] = ode45(@fun1,[tstart tuntil],[0 y2ini],options);
            case 2
            [t,y] = ode45(@fun2,[tstart tuntil],[0 y2ini],options);
        end
        tzero = -y(end,1)/y(end,2)+t(end);
        error = tzero-tuntil;
        plot(t,y(:,1),'r.');
    end
    
    Tthis = tzero;
    
    T = [T Tthis];
    fprintf('iteration number %d; total %d \n',i,Ares)
end