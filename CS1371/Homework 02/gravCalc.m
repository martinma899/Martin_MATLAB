
function [Fg] = gravCalc (m , d)

    % define constants - gravity and earth's mass
    G = 6.67e-11;
    earthMass = 5.97e24;
    
    % using the formula to calculate gravatational force
    % Fg = earthMass*G*m/(d^2); -- this works
    % Fg = G*earthMass*m/(d^2); -- this works
    % Fg = G*m*earthMass/(d^2); -- this doesn't work!!!
    % Fg = earthMass*m*G/(d^2); -- this doesn't work!!!
    % Fg = m*G*earthMass/(d^2); -- this doesn't work!!!
    % Fg = m*earthMass*G/(d^2); -- this doesn't work!!!
    
    % lesson learned:
    % 1. d^2 is exactly the same as d*d
    % 2. A*(B*C) is not the same as (A*B)*C, given the rounding error.
    % 3. It took me hours to figure this out with a debug program.
    % And yes, it was painful and fun.
    
    Fg = earthMass*G*m/(d^2);

end

%{
Function Name: gravCalc

Inputs: 1. (double) The mass of an object (in kilograms) 2. (double) The
distance from the center of the Earth to the center of the object (in
meters)

Outputs: 1. (double) The force of gravity between earth and the object
Function Description:  Write a function that calculates the force of
gravity between the Earth and some other object. The formula for gravity
is:

forceGravity = G*m1*m2/d^2

m1 will always be the mass of the earth, which is 5.97e24 kg. m2 will be
the input mass of the other object. d is the input distance. You can assume
this will be the distance between the centers of mass of the two objects. G
is the universal gravitation constant, which is 6.67e-11 m^3/(kg*s^s). You
can also assume all inputs will be in SI units and your output should be in
Newtons, 1N = 1kg*m/s^2 (no unit conversions will be necessary).

Notes: ? You will want to use 5.97e24 instead of 5.97*10^24. If you do not
use e, your answer will be off because of how MATLAB approximates
calculations.
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/22/2015 5:05 PM --%