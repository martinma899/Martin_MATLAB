
function [spheres] = spherePacking (radius , edge)

    % mathematically proven maximum packing density
    density = 0.74048;
    
    % calculate the volume of a cube
    cubeVolume = edge^3;
    
    % calculate the volume of one given sphere
    oneSphereVolume = (4/3) * pi * radius^3;
    
    % calculate the maximum volume spheres can occupy
    maxSphereVolume = cubeVolume * density;
    
    % divide the two and use floor function to find the maximum amount of 
    % spheres to be fitted
    spheres = floor(maxSphereVolume/oneSphereVolume);

end

%{
Function Name: spherePacking

Inputs: 1. (double) The sphere radius 2. (double) The length of the side of
a cube

Outputs: 1. (double) The number of spheres that will fit into the cube

Function Description: The problem of sphere packing (how many spheres will
fit into a given volume) is actually a non-trivial problem in mathematics
and was only proven in the 1990’s. If you would like to read more about the
problem, you can follow these links:

http://mathworld.wolfram.com/SpherePacking.html
https://en.wikipedia.org/wiki/Sphere_packing

Otherwise, you are welcome to take for granted that the maximum packing
density of spheres in a cube is 74.048%. That means that under the best
packing scenario, the spheres will occupy 74.048% of the cube’s volume.
Given this and the radius of a sphere and the edge length of a cube, write
a MATLAB function, spherePacking, to calculate the maximum number of
spheres that will fit in the cube. You cannot have fractional spheres.

Notes: The floor() function may be useful.
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/22/2015 11:52 PM --%