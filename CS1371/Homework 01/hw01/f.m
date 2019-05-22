
function [output] = f (x)
    
    % find the numerator of the function
    numerator = 1.17 * sqrt(1 + x^0.9) + sinh(x^2 - 4);

    % find the denominator of the function
    denominator = 1.6487 * exp(x^2 - g(x));

    % devide the two to obtain the fina result
    output = numerator / denominator;

end

function [outputForG] = g (xForG)

    % the helper function g is created to help simplify the code
    outputForG = xForG * abs(xForG);

end

%{
Function Name: f

Inputs: 1. (double) An x-value at which to evaluate f(x)

Outputs: 1. (double) The y-value of f(x) evaluated for the given input

Function Description:  Write a function in MATLAB to evaluate the function,
f(x), shown below, for any x-value:

... something huge, excuse me for not typing it...

Where g(x) is another function of x, given by:

g(x) = x * abs(x)
 
Notes: ? The “sinh” is the hyperbolic sin.  There is a built-in function in
MATLAB for it. ? exp () is the exponential of whatever is contained within
the parentheses, and there is also a built-in MATLAB function for this.

Hints: ? A helper function may be useful for g(x).
%}

% Thank you Sean and Rachael for grading our work. We appreciate it.

%-- 8/20/2015 3:20 PM --%