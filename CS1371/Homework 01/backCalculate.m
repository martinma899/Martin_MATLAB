
function [sideB] = backCalculate( sideA , hypotenuse )

    % find the square of the other side using Pythagorean theorem
    sideBSquared = hypotenuse^2 - sideA^2; 

    % use the built in square root function to find the other side
    sideB = sqrt(sideBSquared);

end

%{
Function Name: backCalculate

Inputs: 1. (double) The length of “Side A” of a right triangle 2.
(double)The length of the Hypotenuse of the same right triangle

Outputs: 1. (double) The length of “Side B” of the same right triangle

Function Description:  For the most part, the Pythagorean Theorem is used
to calculate the hypotenuse of a right triangle given the lengths of the
other two sides, “Side A” and “Side B,” and is given by the following: Side
A^2 + Side B^2 = Hypotenuse^2

Write a MATLAB function to back-calculate for the length of “Side B” of a
right triangle given the lengths of “Side A” and the Hypotenuse.  This will
involve some simple algebraic manipulation.
%}

% Thank you Sean and Rachael for grading our work. We appreciate it.

%-- 8/20/2015 2:29 PM --%