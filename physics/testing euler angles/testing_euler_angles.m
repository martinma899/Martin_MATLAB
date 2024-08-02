% want to try to demonstrate whether the moment of inertias are invariant
% to the position vector component being expressed in differently oriented
% orthonormal systems. 

% x y z are components of vector r expressed in system 1, with unit vectors
% i j k
% r = xi+yj+zk
% x2 y2 z2 are components of vector r expressed in system 2, with unit
% vectors i2 j2 k2
% r = x2i2+y2j2+z2k2
% so that: 
% [i j k][x;y;z] = [i2 j2 k2][x2;y2;z2]
% an orthonormal matrix T transforms between the two coordinate systems: 
% T[i j k] = [i2 j2 k2]
% [i j k][x;y;z] = T[i j k][x2;y2;z2]
% if [i j k] is chosen to be the static unit frame, then [i j k] is the
% identity matrix. 
% so T = [i2 j2 k2]
% [x;y;z] = T[x2;y2;z2]
% T'[x;y;z] = [x2;y2;z2]
% [i2 j2 k2]'[x;y;z] = [x2;y2;z2]

clc;clear

% % create a random T by diagnalizing a random symmetric matrix
% A = rand(3);
% A([2 3 6]) = A([4 7 8])
% 
% [~,~,T] = eig(A)

% what if T is only the rotation around one axis
t = rand(1)*2*pi
T = [cos(t) -sin(t) 0;
     sin(t) cos(t) 0;
     0 0 1]

% create random x y z
x = rand(1)
y = rand(1)
z = rand(1)

% x components in primary reference frame
xv = [x;y;z]

% x components in secondary reference frame
xv2 = T'*xv
x2 = xv2(1)
y2 = xv2(2)
z2 = xv2(3)

% compute moments of inertia of expression 1
Ixx = y^2+z^2
Iyy = x^2+z^2
Izz = x^2+y^2
Ixy = x*y
Iyz = y*z
Ixz = x*z

% compute moments of inertia of expression 2
Ixx2 = y2^2+z2^2
Iyy2 = x2^2+z2^2
Izz2 = x2^2+y2^2
Ixy2 = x2*y2
Iyz2 = y2*z2
Ixz2 = x2*z2

% proving that in differently oriented frames, differently expressed x, y
% and z components lead to different moment and product inertia results. 

% moment of inertia and product of inertia's x, y and z are components of r
% expressed in the frame's body-fixed system. When this is true, we can
% ensure x, y and z values are constants because the body is rigid. Thus
% treating the moment and product of inertia as constants. 

% In order for us to choose a different secondary frame from a body fixed
% frame to analyze rotational dynamics, where the body fixed frame has a 
% relative angular velocity, to this secondary frame, we must ensure that 
% moment of inertia calculated from r components expressed in this 
% secondary frame are the same, constant inertias calculated in the body
% fixed frame. 

% this is usually not true, as shown by the code. But due to symmetries of
% the object and careful selection of the secondary frame and some good
% reasoning, this can be true. And this can simplify our problem solving. 