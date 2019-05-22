clear;clc;close('all')

% define building parameters
k = 1e6; % a big spring constant
m = 26000; % 10000 kg per floor
gamma = 0; % damping factor
n = 10; % building floors
z = [1 zeros(1,n-1)]; % make the z vector

% define forcing parameters - a sinusoid
f = 0.987037056248191; % frequency
omega = 2*pi*f; % angular velocity
A = 2; % amplitude, not a crazy number

% define simulation parameters
tf = 60; % simulation time
w = 20; % width of a floor
h = 1.5; % height of a floor rectangle
fh = 6; % vertical distance between one floor rectangle center and the next
startpercentage = 0; % start playing animation at a percentage into it 
% 0.5 is only play animation starting from 50 percent into it

% initial conditions of x and x'
x0i = zeros(1,n);
x1i = zeros(1,n);

% diagonalize K matrix
K = Kmatgen(n);
[V,D] = eig(K);
lambdas = sum(D);

% cut off roundoff error and make entries that are supposed to be zero zero
errorThreshold = 1e-13;
V(abs(V)<=errorThreshold) = 0;
lambdas(abs(lambdas)<=errorThreshold) = 0;
 
% araw is a cell array of raw a solutions with different lengths
% because ODE45 uses its custom integration scheme and the number of
% total steps cannot be controlled. To obtain actual x solution, we will
% need to use the longest t string and extrapolate the rest of a's onto it
araw = cell(1,n);
a1raw = cell(1,n);
a2raw = cell(1,n);
traw = cell(1,n);
arawlength = zeros(1,n);

oderelTol = 1e-7;
odeabsTol = 1e-7;

% print out all the parameters in command window
fprintf('Differential Equation 2562 final project\n')
fprintf('Zhuo Ma - zma70@gatech.edu\n\n')
fprintf('Building Shaking in Earthquake Simulation\n')
fprintf('Modeled as a Second Order Constant Coefficient System\n\n')
fprintf('Code completed: 12/6/16\n\n')
fprintf('-----------------------------------------------------------\n\n')
fprintf('--> Input Parameters <--\n')
fprintf('all input parameters in SI units\n\n')
fprintf('-> Building Parameters <-\n')
fprintf('n number of floors: %d\n',n);
fprintf('m mass of each floor: %f\n',m);
fprintf([char(947) ' internal friction coefficient: %f\n'],gamma);
fprintf('k spring constant between floors: %f\n\n',k);
fprintf('-> Forcing Sine Wave Parameters <-\n');
fprintf('A amplitude: %2.2f\n',A);
fprintf('f frequency: %2.2f\n\n',f);
fprintf('-> Simulation Parameters and Visuals <-\n')
fprintf('tf total simulation time: %3.2f\n',tf)
fprintf('w displayed rectangle width: %2.1f\n',w)
fprintf('h displayed rectangle height: %2.1f\n',h)
fprintf('fh displayed distance between the \ncenter of adjacent rectangles: %2.1f\n',fh)
fprintf('simulation start at %f percent of \nthe entire calculation\n\n',startpercentage*100);
fprintf('-> ODE Solver Tolerances <-\n')
fprintf('Absolute Tolerance: %1.1e\n',odeabsTol);
fprintf('Relative Tolerance: %1.1e\n\n',oderelTol);
fprintf('-> Eigenvalues <-\n')
disp(lambdas')
fprintf('\n\n')
exec = input('Inputs look good? Proceed calculation? Press enter for ''Yes'' or type ''no''\n','s');
if strcmpi(exec,'no')
    clear;clc;close('all')
    return
end
fprintf('\n ---> Solving The System <---\n')
% set ODE tolerance
odeopt = odeset('relTol',oderelTol,'absTol',odeabsTol);

% calculate a's for every eigenvalue
for i = 1:n
    fprintf('solving coefficient %d\n',i)
    ui = V(:,i); % the eigenvector this iteration
    lambda = lambdas(i); % the lambda this iteration
    a0 = [dot(ui,x0i) dot(ui,x1i)]; % the a initial condition this iter
    % compte
    [ti,ai] = ode45(@(t,a) aeqn(t,a,lambda,k,gamma,m,omega,A,ui,z), ...
        [0 tf], a0);
    arawlength(i) = numel(ti);
    araw{i} = ai(:,1);
    a1raw{i} = ai(:,2);
    a2raw{i} = (k/m*A*sin(omega*ti)+gamma/m*A*omega*cos(omega*ti))...
        *(dot(ui,z))-lambda*gamma/m*ai(:,2)-lambda*k/m*ai(:,1);
    traw{i} = ti;
end

fprintf('interploating and post processing\n\n')

% interpolate a with the longest t
[maxtlength,longestind] = max(arawlength);
tfine = traw{longestind};
afine = zeros(n,maxtlength);
a1fine = zeros(n,maxtlength);
a2fine = zeros(n,maxtlength);

fprintf('total time steps: %d\n\n',maxtlength);

for i = 1:n
    if i == longestind
        afine(i,:) = araw{i};
        a1fine(i,:) = a1raw{i};
        a2fine(i,:) = a2raw{i};
    else
        afine(i,:) = spline(traw{i},araw{i},tfine);
        a1fine(i,:) = spline(traw{i},a1raw{i},tfine);
        a2fine(i,:) = spline(traw{i},a2raw{i},tfine);
    end
end

% go back and find x array
xarr = V*afine;
x1arr = V*a1fine;
x2arr = V*a2fine;

wdata = input('Write data to Excel file? Press enter is no, enter ''yes'' is yes\n','s');
if strcmpi(wdata,'yes')
    wdata = true;
else
    wdata = false;
end
if wdata
    xlsname = input('Name the output file, no .xlsx extension.\n','s');
    fprintf('Writing file...\n')
    header1 = cell(1,n);
    header2 = cell(1,n);
    header3 = cell(1,n);
    header1{1} = 'Position';
    header2{1} = 'Velocity';
    header3{1} = 'Acceleration';
    header1 = [header1;num2cell(1:n)];
    header2 = [header2;num2cell(1:n)];
    header3 = [header3;num2cell(1:n)];
    theader = [{'time'};{''}];
    header = [theader header1 header2 header3];
    temparr = num2cell([tfine xarr' x1arr' x2arr']);
    writearr = [header;temparr];
    xlswrite([xlsname '.xlsx'],writearr)
    fprintf('\nFinished writing data. Let''s animate.\n')
end
fprintf('-> Animation Starts in\n')
pause(0.5)
fprintf('3\n')
pause(0.5)
fprintf('2\n')
pause(0.5)
fprintf('1\n')
pause(0.5)
fprintf('-- Remember to full screen the window for best visual effects!\n')
fprintf('-- I had a great semester in the class. Thank you Hagop and Dr. de la Llave! Best wishes in the future!\n') 

% differentiate the time data to find out the pause time of each cycle
% for realistic animation
pausetimevec = [diff(tfine);0];
startframe = 1+ceil((maxtlength-1)*startpercentage);
if n>=10
    ax = [-3*w 3*w 0 fh*n*1.2];
else
    ax = [-3*w 3*w 0 fh*10];
end

% loop the animation
close all
hold on
for i = startframe:maxtlength
    xveci = xarr(:,i);
    clf
    labelparameter(n,k,m,gamma,f,A,tf,tfine(i),maxtlength,i,fh*n*0.8/8,w);
    plotrectangle(A*sin(omega*tfine(i)),0,w,h,ax,'r-');
    for j = 1:n
        plotrectangle(xveci(j),j*fh,w,h,ax,'m-');
    end
    axis off
    pause(pausetimevec(i))
end