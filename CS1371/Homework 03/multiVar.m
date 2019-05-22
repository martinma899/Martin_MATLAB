
function [z] = multiVar (x,y)

    % This function takes vectors and performs a multi-var calculation.
    
    % The use of dot multiply and dot divide to perform the operation with
    % respect to each element of the vectors.

    z = (x.*y-sqrt(x)./y)./(3.*x+y);

end

%{

Function Name: multiVar

Inputs: 1. (double) A vector of ? values 2. (double) A vector of ? values

Outputs: 1. (double) A vector of the function ?(?,?) evaluated at
corresponding ? and ? values.

Function Description:  Write a MATLAB function that will evaluate the shown
multi-variable function for vectors of ? and ? values. Your function
should output a vector of the function evaluated for corresponding ? and
? values. For example, the third index of your output vector should be the
following function evaluated using values from the third index of the input
? and ? vectors.

z(x,y)=(x*y-x^(1/2)/y)/(3*x+y)

Notes: ? Recall that the use of “dot operators” is important for
mathematical operations with vectors, excluding addition and subtraction.

%}

% Thank you Sean and Rachael for grading our work!

%-- 9/3/2015 12:30 PM --%