
function [distance] = distCalc (x1,y1,x2,y2)

    % using the formula to calculate the distance
    distance = sqrt((x2-x1)^2+(y2-y1)^2);
    
    % round the distance to the hundredths place
    distance = round(distance,2);

end

%{
Function Name: distCalc

Inputs: 1. (double) The x-coordinate of a given point A 2. (double) The
y-coordinate of point A 3. (double) The x-coordinate of another point B 4.
(double) The y-coordinate of point B

Outputs: 1. (double) The distance between points A and B

Function Description:  Write a function, distCalc, in MATLAB, that will
calculate the distance between the two Cartesian points defined in the
inputs. The formula for calculating distance between 2 points is: 

distance = sqrt((x2-x1)^2+(y2-y1)^2)

Round your answer to the hundredths place.
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/22/2015 11:24 PM --%