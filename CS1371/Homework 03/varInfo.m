
function [output] = varInfo (var)

    % This function describes the information of a variable.

    % First Use the num2str command to convert either a character or a double
    % into a string of characters.
    
    % Then use the class command to get a string that describes the
    % variable.
    
    % Finally, use the sprintf command to format all three of them into a
    % string of characters.
    
    output = sprintf('This variable is of class %s and has a value of ''%s''.'...
    ,class(var),num2str(var));

end

%{

Function Name: varInfo

Inputs: 1. (double) A number or vector of any length. OR (char) A string of
any length.

Outputs: 1. (char) An output string describing the input variable.

Function Description: Write a MATLAB function to identify the class of the
input variable and to display its value. Your function should output a
string of the form:

This variable is of class ____ and has a value of ‘____’.

For example, if the input variable is the number 25, then your function
should output the string: This variable is of class double and has a value
of ‘25’. If instead the input variable is the string ‘CS 1371’, then your
function should output the string: This variable is of class char and has a
value of ‘CS 1371’.

Notes: ? Make sure that your output variable matches the answers to the
solution file EXACTLY. Any extra/missing spaces or characters will result
in a 0 for this problem. ? Using the MATLAB function num2str() on a string
will not affect its data value and will output the same string. You will
want to use num2str() on the vector to print the vector to a string with
spaces between the indices.  Do NOT use mat2str() for this function. ? The
period at the end of the output strings shown above is part of the string.

Hints: ? Use isequal() to know if your output and the solution file output
are exactly the same. ? The class(), num2str(), and sprintf() functions
will be useful. ? To get an apostrophe into a string, type two apostrophes
into MATLAB.

%}

% Thank you Sean and Rachael for grading our work! We appreciate it!

%-- 9/3/2015 12:30 PM --%
