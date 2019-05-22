clear;clc
close all
 
options = odeset('RelTol',1e-3,'AbsTol',1e-3);
 
omega = 1;
ti = 0;
y1i = 0;
y2i = 1;
 
% let's do iterative stepping, find all roots of y1 and y2 within the
% boundary to find y1 amplitude and y2 amplitude. 
 
interval = [20 30];
basicstepresolution = 30;
tfstring = linspace(interval(1),interval(2),basicstepresolution);
 
newtontol = 1e-6;
 
omegares = 500;
omegastring = linspace(0,3,omegares);
 
Ayarr = [];
Ay1arr = [];
 
for k = 1:omegares
 
    omega = omegastring(k);
    
    tRootBucketY1 = [];
    tRootBucketY2 = [];
    
    tf = tfstring(1);
    [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tf],[y1i,y2i]);
    y = ysoln(:,1);
    y1 = ysoln(:,2);
    y2 = cos(omega*t)-0.1*y1-y;
 
    signY1Last = y1(end)/abs(y1(end));
    signY2Last = y2(end)/abs(y2(end));
 
    for i = 1:basicstepresolution
        % set resolution for basic stepping; will decrease this if computation
        % time is too long.
        options = odeset('RelTol',1e-3,'AbsTol',1e-3);
 
        % compute a guess stepping
        tf = tfstring(i);
        [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tf],[y1i,y2i]);
        y = ysoln(:,1);
        y1 = ysoln(:,2);
        y2 = cos(omega*t)-0.1*y1-y;
 
        % look at signs of last entry
        signY1 = y1(end)/abs(y1(end));
        signY2 = y2(end)/abs(y2(end));
 
        % if it changed sign, do newton't method
        if signY1~=signY1Last
            % set ODE solver options; want precision.
            options = odeset('RelTol',1e-6,'AbsTol',1e-6);
 
            tnow = t(end-1);
            y1now = y1(end-1);
            y2now = y2(end-1);
            tnext = -y1now/y2now+tnow;
            error = tnext-tnow;
 
            while error>newtontol
                tnow = tnow+0.5*error;
 
                [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tnow],[y1i,y2i]);
                y = ysoln(:,1);
                y1 = ysoln(:,2);
                y2 = cos(omega*t)-0.1*y1-y;
 
                tnow = t(end);
                y1now = y1(end);
                y2now = y2(end);
                tnext = -y1now/y2now+tnow;
                error = tnext-tnow;
            end
 
            tRootBucketY1 = [tRootBucketY1 tnext];
 
        end
 
        % For y1, find roots using y2 and estimated y3.
        if signY2~=signY2Last
            % set ODE solver options; want precision.
            options = odeset('RelTol',1e-6,'AbsTol',1e-6);
 
            tnow = t(end-1);
            y2now = y2(end-1);
            y3now = (y2(end-1)-y2(end-2))/(t(end-1)-t(end-2));
            tnext = -y2now/y3now+tnow;
            error = tnext-tnow;
 
            while error>newtontol
                tnow = tnow+0.5*error;
 
                [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tnow],[y1i,y2i]);
                y = ysoln(:,1);
                y1 = ysoln(:,2);
                y2 = cos(omega*t)-0.1*y1-y;
 
                tnow = t(end);
                y2now = y2(end);
                y3now = (y2(end)-y2(end-1))/(t(end)-t(end-1));
                tnext = -y2now/y3now+tnow;
                error = tnext-tnow;
            end
 
            tRootBucketY2 = [tRootBucketY2 tnext];
        end
 
        % if it did, do newton's method to find root to a tolerance
 
        % finally record the signs
        signY1Last = signY1;
        signY2Last = signY2;
    end
 
    figure (1)
    subplot(3,1,1);
    plot(t,y,'b.');
    title('y vs t');
    subplot(3,1,2);
    plot(t,y1,'r.');
    title('y'' vs t');
    subplot(3,1,3);
    plot(t,y2,'g.');
    title('y'''' vs t');
    
    % now that we have found the roots within the interval for y and y1,
    % let's find peaks by integrating.
 
    % define containers for peaks
    ypeaks = [];
    y1peaks = [];
 
    options = odeset('RelTol',1e-6,'AbsTol',1e-6);
 
    for j = 1:numel(tRootBucketY1)
        [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tRootBucketY1(j)],[y1i,y2i]);
        ypeaks = [ypeaks ysoln(end,1)];
    end
 
    for j = 1:numel(tRootBucketY2)
        [t,ysoln] = ode45(@(t,y) fun(t,y,omega),[ti,tRootBucketY2(j)],[y1i,y2i]);
        y1peaks = [ypeaks ysoln(end,2)];
    end
 
    % find maximum amplitude
    Ay = max(abs(ypeaks));
    Ay1 = max(abs(y1peaks));
    
    Ayarr = [Ayarr Ay];
    Ay1arr = [Ay1arr Ay1];
    
    fprintf('omega: %f iteration: %d total: %d \n',omega,k,omegares);
    fprintf('t1roots: %s \n',num2str(tRootBucketY1,7));
    fprintf('t2roots: %s \n',num2str(tRootBucketY2,7));
    fprintf('ypeaks: %s \n',num2str(ypeaks,7));
    fprintf('y1peaks: %s \n',num2str(y1peaks,7));
    fprintf('max y amplitude: %f max y1 amplitude: %f \n',Ay,Ay1);
    fprintf('\n')
    
    figure(2)
    subplot(2,1,1);
    plot(omegastring(1:k),Ayarr,'linestyle','-','marker','.','color','b')
    title('omega vs Ay');
    subplot(2,1,2);
    plot(omegastring(1:k),Ay1arr,'linestyle','-','marker','.','color','r')
    title('omega vs Ay1');
    
    pause(0.01)
 
end