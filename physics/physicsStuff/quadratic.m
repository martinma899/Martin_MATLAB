
function [root1 , root2] = quadratic (a , b , c)

    % using quadratic formula to calculate first root
    root1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a);
    
    % using quadratic formula to calculate second root
    root2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a);

end

%{
Function Name: quad

Inputs: 1. (double) The coefficient A of a quadratic polynomial 2. (double)
The coefficient B of a quadratic polynomial 3. (double) The coefficient C
of a quadratic polynomial

Outputs: 1. (double) The positive root of the polynomial 2. (double) The
negative root of the polynomial

Function Description: Write a function to evaluate the two roots of a
quadratic polynomial. In terms of the coefficients A, B, and C, the
positive and negative roots are given by: 

root 1 = (-b + sqrt(b^2 - 4*a*c)) / (2*a)
root 2 = (-b - sqrt(b^2 - 4*a*c)) / (2*a)

Notes:
? The terms “positive root” and “negative root” only refer to which sign is
used in the quadratic formula and do not actually indicate the sign of each
root.  Do not worry if the “positive root” output is a negative number, or
vice versa.
%}

% Thank you Sean and Rachael for grading our work. We appreciate it.

%-- 8/20/2015 3:02 PM --%
