
function [c] = lawOfCosines (a,b,alpha)

    % using law of cosine to find c squared
    cSquared = a^2 + b^2 - 2*a*b*cosd(alpha);
    
    % using built in function to find the square root of c squared
    c = sqrt(cSquared);

end

%{
Function Name: lawOfCosines

Inputs: 1. (double) The length of side a 2. (double) The length of side b
3. (double) The angle between sides a and b (C in the diagram), in degrees

Outputs: 1. (double) The length of side c

Function Description: Write a MATLAB function that will solve for the
length of the third side of a triangle (c in the picture) given the
opposite angle and two other side lengths, as shown in the picture below.

-- Need to learn better coding to let MATLAB draw pictures for me --

Notes: 
? The law of cosines (as the name of the problem implies) may prove
to be very helpful. ? For reference: c^2 = a^2 + b^2 - 2*a*b*cosd(alpha) 
?
MATLAB has a built in function for the evaluation of cosine in degrees:
cosd()
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/22/2015 11:24 PM --%