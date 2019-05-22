function flyPropellerHat (az,el,exit)

    close all % close all figures
    
    view(az,el) % set the view

    vel = [0 0 0]; % initialize velocity -- start from velocity being 0
    accel = [0 0 0.02]; % accelerate upwards 0.02 unit per 0.01s
    pos = [0 0 -60]; % initialize position -- start from middle bottom

    tprop = 0; % initialize propeller angle -- 0 radian
    zangle = 0; % initialize the z axis rotation angle -- 0 radian
    zrvel = 0; % initialize the z velocity
    h = 10; % wobbling height is 10
    
    % make the base cases of the hat
    [xxCap, yyCap, zzCap] = makeCap(5, [-6/5^5 0 0 0 0 6]);
    [xxBill, yyBill, zzBill] = makeBill(5,4.5);
    [xxProp,yyProp,zzProp] = makePropeller(-6,6,1);
    
    % read three backgrounds
    img1 = imread('gt.png'); % read first image
    img2 = imread('cs.png'); % read second image
    img3 = imread('matlab.png'); % read third image
    
    % make the background meshes
    y1 = -60:60;
    z1 = -60:60;
    [yy1,zz1] = meshgrid(y1,z1);
    xx1 = 60*(1+0*yy1);
    img1 = double(img1)/255;
    
    x2 = -60:60;
    z2 = -60:60;
    [xx2,zz2] = meshgrid(x2,z2);
    yy2 = 60*(1+0*xx2);
    img2 = double(img2)/255;
    
    x3 = -60:60;
    y3 = -60:60;
    [xx3,yy3] = meshgrid(x3,y3);
    zz3 = -60*(1+0*xx3);
    img3 = double(img3)/255;
    
    % define GT's colors for the hat!!
    [capa,capb] = size(xxCap);
    [billa,billb] = size(xxBill);
    [propa,propb] = size(xxProp);
    
    billcol = makecolormap([0 43 84],[billa,billb]);
    propcol = makecolormap([0 0 0],[propa,propb]);
    capcol = makecolormap([245 173 0],[capa,capb]);
    
    % make the edge vectors
    xe = 60*[-1,1,1,1,1];
    ye = 60*[1,1,1,1,-1];
    ze = 60*[-1,-1,1,-1,-1];
    
    xo = 60*[-1,-1,1,1,1,-1,-1];
    yo = 60*[1,1,1,-1,-1,-1,1];
    zo = 60*[-1,1,1,1,-1,-1,-1];
    
    count = 0;
    
while count<exit
    
    pos(3) = -50;
    vel([1 2]) = 0;
    
    % the ascending loop
    while pos(3)<=50
        
        % do propeller rotation calculation first
        if tprop >= 2*pi
            tprop = tprop-2*pi;
        end
        tprop = tprop+pi/4;
        
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxProp,yyProp,zzProp,'z',tprop);
        
        % do the z rotation calculation
        if zangle>=2*pi
            zangle = zangle-2*pi;
        end
            zangle = zangle+zrvel;
        
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCap,yyCap,zzCap,'z',zangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBill,yyBill,zzBill,'z',zangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'z',zangle);        
        
        % then do the displacement calculations
        vel = vel+accel;
        pos = pos+vel;
        
        [xxCapG,yyCapG,zzCapG] = updateCoords(xxCapG,yyCapG,zzCapG,pos);
        [xxBillG,yyBillG,zzBillG] = updateCoords(xxBillG,yyBillG,zzBillG,pos);
        [xxPropG,yyPropG,zzPropG] = updateCoords(xxPropG,yyPropG,zzPropG,pos);
        
        % display and pause
        surf(xxCapG,yyCapG,zzCapG,capcol,'EdgeColor','none');
        hold on
        surf(xxBillG,yyBillG,zzBillG,billcol,'EdgeColor','none');
        surf(xxPropG,yyPropG,zzPropG,propcol,'EdgeColor','none');
        surf(xx1,yy1,zz1,img1,'EdgeColor','none');
        surf(xx2,yy2,zz2,img2,'EdgeColor','none');
        surf(xx3,yy3,zz3,img3,'EdgeColor','none');
        plot3(xe,ye,ze,'k-');
        plot3(xo,yo,zo,'k--');
        hold off
        axis([-60 60 -60 60 -60 60]);axis square;axis off
        camproj('perspective')
        title('CS 1371 Final Project -- Flying Hat Collision Simulation')
        
        pause(0.01);
        
    end
    
    % top collision
    % generate random x and y collision velocity
    randangle = rand(1)*2*pi;
    vel(1) = cos(randangle)*vel(3);
    vel(2) = sin(randangle)*vel(3);
    
    % generate a random z rotation velocity
    zrveli = rand(1)*pi/2;
    
    % reverse z velocity
    maxzvel = vel(3);
    vel(3) = -vel(3);
    
    % initialize the wobbling angle
    that = 0;
    
    % the descending loop
    while vel(3)<= 0
        
        % do propeller rotation calculation first
        if tprop >= 2*pi
            tprop = tprop-2*pi;
        end
        tprop = tprop+pi/4;
        
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxProp,yyProp,zzProp,'z',tprop);
        
        % do the position calculation, involving collision and changing
        % direction
        vel = vel+accel;
        pos = pos+vel;
        if abs(pos(1))>=50
            vel(1) = -vel(1);
        end
        if abs(pos(2))>=50
            vel(2) = -vel(2);
        end
        
        % do the wobbling calculation. Wobbling radius r is dependent upon
        % the absolute value of z velocity.
        
        r = 10*abs(vel(3)/maxzvel);
        
        if that >= 2*pi
            that = that-2*pi;
        end
        that = that+pi/5;
        
        x = r*cos(that);
        y = r*sin(that);
        
        ywobbleangle = atan(x/h);
        xwobbleangle = atan(y/h);
        
        % do the z rotation calculation.
        % z rotation velocity also constantly decelerates.
        % This is achieved also by making z rotational velocity dependent
        % on z translational velocity.
        % equation guarantees 30% of z rotational velocity remaining at the
        % bottom.
        
        zrvel = ((-vel(3)/maxzvel)*0.7+0.3)*zrveli;
        
        if zangle>=2*pi
            zangle = zangle-2*pi;
        end
            zangle = zangle+zrvel;
        
        % x wobble update
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCap,yyCap,zzCap,'y',ywobbleangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBill,yyBill,zzBill,'y',ywobbleangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'y',ywobbleangle);
        
        % y wobble update
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCapG,yyCapG,zzCapG,'x',xwobbleangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBillG,yyBillG,zzBillG,'x',xwobbleangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'x',xwobbleangle);
        
        % z rotation update
        [xxCapG,yyCapG,zzCapG] = rotateObject (xxCapG,yyCapG,zzCapG,'z',zangle);
        [xxBillG,yyBillG,zzBillG] = rotateObject (xxBillG,yyBillG,zzBillG,'z',zangle);
        [xxPropG,yyPropG,zzPropG] = rotateObject (xxPropG,yyPropG,zzPropG,'z',zangle);        
        
        % coordinate update
        [xxCapG,yyCapG,zzCapG] = updateCoords(xxCapG,yyCapG,zzCapG,pos);
        [xxBillG,yyBillG,zzBillG] = updateCoords(xxBillG,yyBillG,zzBillG,pos);
        [xxPropG,yyPropG,zzPropG] = updateCoords(xxPropG,yyPropG,zzPropG,pos);
        
        % display
        surf(xxCapG,yyCapG,zzCapG,capcol,'EdgeColor','none');
        hold on
        surf(xxBillG,yyBillG,zzBillG,billcol,'EdgeColor','none');
        surf(xxPropG,yyPropG,zzPropG,propcol,'EdgeColor','none');
        surf(xx1,yy1,zz1,img1,'EdgeColor','none');
        surf(xx2,yy2,zz2,img2,'EdgeColor','none');
        surf(xx3,yy3,zz3,img3,'EdgeColor','none');
        plot3(xe,ye,ze,'k-');
        plot3(xo,yo,zo,'k--');
        hold off
        axis([-60 60 -60 60 -60 60]);axis square;axis off
        camproj('perspective')
        title('CS 1371 Final Project -- Flying Hat Collision Simulation')
        pause(0.01);
        
    end
    
    count = count+1;
    
end

end

% Comments section! lemme explain what this thing does!!

% First, how to use this?
% The function has 3 input parameters and 0 output. The first two specify
% the view point, following the same rule as matlab view() command's two
% parameters. Recommended setting is -30 and 30. That's the setting I
% prefer to use.
% The third parameter is the terminating condition -- after how many
% collisions do you terminate the program. For instance, setting the third
% parameter to 5 means to stop after 5 collisions.

% Sample line, using a view(-30,30), terminating after 5 collisions:
% flyPropellerHat(-30,30,5)

% So essentially this is a propeller hat collision simulation. The
% propeller hat is released from the lowest point with 0 upward velocity,
% constant z rotation left over from last collision, and constant upward 
% acceleration. The hat accelerates up to the ceiling, when the propeller
% hits the top. At the moment of collision, the z velocity is reversed.
% (perfectly elastic collision) The acceleration remains upwards, which
% means that the hat decelerates as it goes down. At the moment of
% collision, an angle is randomly generated that dictates the x and y
% velocity -- the hat is randomly bounced away. During the process of
% descending, if the hat hits a side wall, it bounces back. Rotation of the
% hat itself is also imposed at the moment of collision. The z rotation is
% simply just rotation. Its initial angular velocity is randomly generated
% in a range at the moment of collision, but this angular velocity also
% constantly decelerates during the fall. The code is designed to guarantee
% that at the bottom, 30 percent of the z angular velocity is left to be
% continued in the next iteration of the main loop. The x and y axis
% wobbling is generated by a parameter of wobbling height (defined to be 10
% units), wobbling radius (dependent upon z translational velocity which is
% decelerating), and a periodically changing angle 'that'. So the wobbling 
% is very severe initially after collision and gradually disappear upon
% reaching bottom.

% The creative components include:
% Making the hat components different colors. GT pride!
% pasting wall paper in the background as stationary objects
% Drawing outlines around the pictures to give observer a sense of 3D
% Using perspective camera projection
% Calculating a stationary hat mesh at the beginning and only rotating and
% translating the same set of mesh matrices every iteration based on
% minimal position and rotation calculation, improving processing speed
% comparing to calculating everything in every iteration.
% And of course, the entire design of collision simulation. It's pretty
% slick. Yup.

function [xxout,yyout,zzout] = updateCoords (xxin,yyin,zzin,coord)

    xxout = xxin+coord(1);
    yyout = yyin+coord(2);
    zzout = zzin+coord(3);

end

function [xx,yy,zzsingle] = makePropeller (xmin,xmax,r)

    theta = linspace(0,pi,10);
    x = linspace(xmin,xmax,20);
    [xx,tt] = meshgrid(x,theta);
    rr = sin(pi*xx/abs(xmin))*r;
    yy = rr.*cos(tt);
    zzsingle = xx*0+7;

end

function [newxx,newyy,newzz] = rotateObject (xx,yy,zz,axis,t)

    [a,b] = size(xx);
    long = a*b;
    newxx = zeros(a,b);
    newyy = zeros(a,b);
    newzz = zeros(a,b);
    
    
    switch lower(axis)
        case 'x'
            for i = 1:long
            vec = [1,0,0;
                   0,cos(t),-sin(t);
                   0,sin(t),cos(t)] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
        case 'y'
            for i = 1:long
            vec = [cos(t),0,sin(t);
                   0,1,0;
                   -sin(t),0,cos(t)] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
        case 'z'
            for i = 1:long
            vec = [cos(t),-sin(t),0;
                   sin(t),cos(t),0;
                   0 0 1] * ...
            [xx(i);yy(i);zz(i)];  
            newxx(i) = vec(1);
            newyy(i) = vec(2);
            newzz(i) = vec(3);
            end
    end

end

function [outarr] = makecolormap (invec,dimvec)

    outarr = ones(dimvec(1),dimvec(2),3);
    for i = 1:3
        outarr(:,:,i) = invec(i);
    end
    outarr = outarr/255;

end

function [xx,yy,zz] = makeCap (r,coeff)

    r = linspace(0,r,30); % create a range of rs
    t = linspace(0,2*pi,30); % create a range of thetas
    [rr,tt] = meshgrid(r,t); % create rr for every theta and tt for every r
    yy = sin(tt).*rr; % use rr and tt to create x and y grids
    xx = cos(tt).*rr;

     zz = polyval(coeff,rr);

end

function [xx,yy,zz] = makeBill (long,r)

    offt = pi/6;
    theta = linspace(offt,pi-offt,20);
    x = linspace(-3,-3-long,10);
    [xx,tt] = meshgrid(x,theta);
    yy = r*cos(tt);
    zz = r*sin(tt)-r*sin(offt);
    
end