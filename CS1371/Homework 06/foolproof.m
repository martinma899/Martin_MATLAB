function [out] = foolproof (in)

    % This function is an upgraded foolproof version of powerOfTwo such that it doesn't take in things such as a cat picture from Wikipedia.

    % classy is a string variable that stores the class of the input.
    classy = class(in);
    
    % Use a switch statement to decide what to do with every class.
    switch classy
        case 'double' 
            % If it is a number, check whether it is a natural number
            if isNatural(in) 
                % If it is a natural number, do the regular power of two.
                out = powerOfTwo(in);
            else
                % If it is not a natural number, display some message.
                out = 'Please input a natural number.';
            end
        case 'char'
            % If it is a character or string, output some message.
            out = 'When you use the '' symbol, it clogs the gears in the computer''s calculator. Please input a natural number.';
        case 'logical'
            % If it is a logical value, display some message.
            out = 'The input type is invalid. Please input a natural number.';
    end

end

function [boo] = isNatural (input)

    % This function checks whether a number is a natural number by
    % comparing itself to its absolute value rounded. If they equal to each
    % other then it must be a natural number.

    if isa(input,'double');
        boo = isequal(input,abs(round(input)));
    else
        boo = false;
    end

end

function [boo] = powerOfTwo (input)

    % This function checks whether a number is a power of two or not.

    % Turn the number into binary then turn into a string.
    str = num2str(dec2bin(input));
    
    % Find the index of '1's.
    mask = str=='1';
    
    % If there's only one '1', then it must be a power of two.
    boo = sum(mask)==1;
    
end

%{
Function Name: foolproof

Inputs: 1. (double, char, or logical) An input that could be correctly or
incorrectly formatted

Outputs: 1. (char or logical) A message prompting a different input, or the
output of powerOfTwo()

Function Description:

At your first day of work, your boss asked you to write a MATLAB function
to determine whether a number is a power of two (it will play a vitally
important role in an initiative to aid in the global integration of synergy
between interdepartmental paradigms). Conveniently, you wrote a function to
do exactly this back in CS 1371. After checking the code with a few test
cases, you upload the function to your department’s shared folder. Within
minutes your coworkers have flooded your email with complaints about errors
in your code; they tried inputting decimals, logicals, and strings—but the
function did not work like it was supposed to.

You realize there is only one option to fix this: write a MATLAB function
called foolproof() to ensure that an input is correctly formatted before it
is called in powerOfTwo(). The input for powerOfTwo() should be a natural
number (a natural number is a positive integer; zero is not included for
the purposes of this problem). If an incorrect input is given, output one
of the following messages:

1. If the input is of type double but it is not a natural number, then the
output should be: Please input a natural number. 2. If the input is of type
logical, then the output should be: The input type is invalid. Please input
a natural number. 3. If the input is of type char, then the output should
be: When you use the ' symbol, it clogs the gears in the computer's
calculator. Please input a natural number.

Given a correctly formatted input, assign the output of powerOfTwo() to
this function’s output.

Notes: ? The input can be of type 'logical', 'char', or 'double'. ? The
strings above appear as they would in the Command Window. They will need to
be formatted differently being assigned to a variable to achieve this
format. ? You may want to use your powerOfTwo() function from previous
weeks as a helper function (the solution code will be posted Tuesday for
it). ? Your string must EXACTLY match the output string. The isequal()
function may be useful.

Hints: ? The functions isnumeric(), islogical(), and ischar() may be
useful.
%}

% Thank you Sean and Rachael for grading our work!

% Done on Thursday night.