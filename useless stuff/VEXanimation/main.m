function main

    global coord    % coordinate of the robot  
    
    global onebs    % the length of one square in pixels, global constant
    global arena    % the arena image file

    global robot    % the image of the robot
    global robotsize 
    
    global myVideo
    myVideo = VideoWriter('firstanimation.avi');
    myVideo.Quality = 100;
    open(myVideo);

    % initialize coordinate and angle
    coord = [50 50 0]; % counter-clockwise is positive, standard math notation
    
    % giving global variables values
    onebs = 120; % the length of a square is 120 pixle; conversion.
    arena = imread('arena.png'); % read the arena image file
    
    % set the specs of the robot
    robotsize = [16 16];
    makerobot(robotsize,randi([0 255],1,3)); % currently random color
    
    turn(-90,10);
    
    close(myVideo);
end

function moveforward (distance,speed) % speed is inch per second

    % open up the video thing

    global myVideo
    global coord
    updaterate = 30; % thirty frames per second
    T = 1/updaterate;
    vel = speed/updaterate;
    onestep = vel*T;
    
    des = coord;
    des(1) = coord(1)+distance*cosd(coord(3));
    des(2) = coord(2)+distance*sind(coord(3));
    
    init = coord;
    
    error = distance-sqrt((coord(1)-init(1))^2+(coord(2)-init(2))^2);
    
    while error>=onestep
        coord(1) = coord(1)+vel*cosd(coord(3));
        coord(2) = coord(2)+vel*sind(coord(3));
        temparena = robotonarena();
        writeVideo(myVideo,temparena);
        imshow(temparena);
        pause(T);
        error = distance-sqrt((coord(1)-init(1))^2+(coord(2)-init(2))^2);
    end
    pause(T);
    coord = des;
    temparena = robotonarena();
    writeVideo(myVideo,temparena);
    imshow(temparena);
end

function turn (angle,omega) % omega is degree per second

    % open up the video thing

    % global myVideo
    global coord
    updaterate = 30; % frequency is thirty frames per second
    T = 1/updaterate; % period calculation
    vel = omega/updaterate; % increment in each iteration
    % onestep = vel*T; % The angle change of one iteration
    
    des = coord(3)+angle;
    
    %init = coord(3);
    
    error = abs(angle); % initialize error
    
    while error>=vel
        coord(3) = coord(3)+vel;
        temparena = robotonarena(); % update arena
        % writeVideo(myVideo,temparena);
        imshow(temparena);
        pause(T);
        error = abs(des-coord(3));
    end
    pause(T);
    coord(3) = des;
    temparena = robotonarena(); % update arena
    imshow(temparena);
end

% put the robot picture in the arena based on coordinates.
% update 
function [temparena] = robotonarena()
    global arena % archived file of the arena
    global onebs % conversion factor -- pixel length of the foam tile
    global coord % coordinates -- updated every time
    global robot % archived file of the robot
    
    % rotate the robot
    robotr = imrotate(robot,coord(3));
    % make a blank array
    blankarena = uint8(zeros(onebs*6,onebs*6,3));
    % place the robot in the correct spot based on coordinates
        % figure out the position indexes in the arena from coords
        arenaposc = round(720*coord(1)/144);
        arenaposr = round(720*(144-coord(2))/144);
        % put the robotr in that position
        robotrsize = size(robotr);
        robotinitialindr = -round(robotrsize(2)/2):robotrsize(2)...
            -round(robotrsize(2)/2)-1;
        robotinitialindc = -round(robotrsize(1)/2):robotrsize(1)...
            -round(robotrsize(1)/2)-1;
        robotrindr = robotinitialindr+arenaposr;
        robotrindc = robotinitialindc+arenaposc;
        blankarena(robotrindr,robotrindc,:) = robotr;
    % filter, put the robot on the arena, spit out the temparena.
    mask = ~blankarena==0;
    temparena = arena;
    temparena(mask) = blankarena(mask);
end

function [pixel] = i2p (inch) % simple inch to pixel conversion
    % five pixels per inch
    pixel = round(inch*5);
end

% initialization procedure
function makerobot (dimension,color)
    global robot
    dimension = i2p(dimension);
    robot = ones(dimension(2),dimension(1),3);
    robot(:,:,1) = color(1);
    robot(:,:,2) = color(2);
    robot(:,:,3) = color(3);
    robot = uint8(robot);
end