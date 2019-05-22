function [A,T] = pendulumperiod
    clear; clc; close all % clear everything
    
    % define E, g, l, and m as global variables
    % so that they can be accessed by ODEFUN function. 
    % ODEFUN evaluates equation @@.
    global E
    global g
    global l
    global m
    % Set parameters so that they will match the equation in the problem
    g = 9.81;
    l = g;
    m = 1/(l*g);
    % define an array of As between -1.9 and 1.9
    % A reasonable resolution would be 101, where the script will take
    % around 29 seconds. 
    A = linspace(-1.9,1.9,1601); 
    % Take the positive half of A and calculate its corresponding E
    % with equation triple star
    Apos = A(A>0);
    Earray = 0.5*m*l^2*Apos.^2;
    % initialize the period data array
    T = [];
    % create function handle for equation @@
    ODEhandle = @ODEFUN;
    % set ODE solver tolerance to small enough so that the random error in 
    % the final T(A) function will be tolerable
    options = odeset('RelTol',1e-7,'AbsTol',1e-7);
    % loop calculate T for every A
    for i = 1:length(Apos)
        % fetch the correct E
        E = Earray(i);
        % use a linear function to define tf to reduce calculation time
        endpoint = 1.6+Apos(i)/1.9;
        % use ode45 to solve euqation @@ numerically
        [Tresult,Yresult] = ode45(ODEhandle,[0 endpoint],0,options);
        % find the two ts where y turns complex. 
        cutoffpoint = find(diff(isrealarray(Yresult))==-1);
        % take their average as T/4. Multiply by four and store in T array
        T = [T 4*mean(Tresult(cutoffpoint:cutoffpoint+1))];
    end
    % Because T is even, mirror the other half of T. 
    T = [T(end:-1:1) 0 T];
    % plot T(A)and label axes
    plot(T,A,'b-');
    xlabel('Initial Angular Velocity at theta = 0(vertical position)')
    ylabel('Period')
end

function [yout] = ODEFUN(t,yin)
    % ode45 requires a separate function to run the code. 
    % this is equation @@.
    global E
    global g
    global l
    global m
    yout = sqrt((E+m*g*l*cos(yin)-m*g*l)./(0.5*m*l^2));
    reshape(yout,length(yout),1);
end

function [logicalout] = isrealarray (in)
    % This is a function that returns the same size logical array
    % where reals are true and complexes are false. 
    % This helps pick out where T/4 is in one line in the main function
    [a,b] = size(in);
    logicalout = logical(zeros(a,b));
    for i = 1:numel(in)
        logicalout(i) = isreal(in(i));
    end
end