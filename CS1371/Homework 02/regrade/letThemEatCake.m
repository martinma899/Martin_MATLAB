
function [totalCake] = letThemEatCake (total , people)

    % calculate leftover pieces with a mod function
    leftOver = mod(total,people);
    
    % calculate the cake you by default eat and add that to leftover
    totalCake = floor(total/people)+leftOver;

end

%{
Function Name: letThemEatCake

Inputs: 1. (double) The number of total pieces of cake 2. (double) The
number of people at your party

Outputs: 1. (double) The number of pieces of cake you will get Function

Description: You are having a birthday party, and are trying to predict how
many pieces of cake you'll get to eat by yourself. Of course, your first
instinct is to write a MATLAB function to do this for you! There are two
inputs: the total number of pieces of cake, and the number of people at the
party. You know that the cake will need to be divided evenly between all
guests at your party, including yourself, and that you want everyone to eat
the same number of cake pieces. Because of this, there might be a few
pieces of cake left over that could not be fairly distributed. These few
pieces left over will be yours to eat after everyone has left, so you will
get all of them. Output the total number of cake pieces you get to eat.
The number of people at the party will always include yourself.  For
example,if there are 20 pieces of cake and 6 people at your party: 18
pieces of cake will be distributed among the 6 people so that each person
gets 3 (including yourself). This will leave 2 pieces of cake remaining
from the original 20, and you will also get these 2 pieces. So your output,
in this case, should be 5. 

Notes: ? The mod() and floor() functions may be
useful.
%}

% Thank you Sean and Rachael for grading our work! Have a nice day!

%-- 8/23/2015 9:46 AM --%