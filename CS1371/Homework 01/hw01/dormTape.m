
function [cost] = dormTape ...
    (blocks,goldFraction,whiteFraction,navyFraction,blocksPerRoll)

    % define the prices and sales tax
    oldGoldPrice = 4.99;
    whitePrice = 2.99;
    navyPrice = 3.99;
    salesTax = 1.08;
    
    % calculate the raw cost of old gold tape
    oldGoldCost = ceil(blocks * goldFraction / blocksPerRoll) * oldGoldPrice;
    
    % calculate the raw cost of white tape
    whiteCost   = ceil(blocks * whiteFraction / blocksPerRoll) * whitePrice;
    
    % calculate the raw cost of navy tape
    navyCost    = ceil(blocks * navyFraction / blocksPerRoll) * navyPrice;
    
    % calculate the taxed total price
    cost = (oldGoldCost + whiteCost + navyCost) * salesTax;
    
    % round the answer to two decimal places
    cost = round (cost , 2);
    
end

%{
Function Name: dormTape

Inputs: 1. (double) The total number of blocks to tape over 2. (double) The
fractions of blocks to be old gold 3. (double) The fraction of blocks to be
white 4. (double) The fraction of blocks to be navy blue 5. (double) The
number of blocks one roll of tape can cover

Outputs: 1. (double) The total cost of the project

Function Description: You have officially moved into your new residence
hall and notice that the off-white painted cinderblock walls are pretty
bland, so you decide to spruce things up a little bit by covering different
blocks in the wall with different color tape to make a nice geometric
pattern. You want to do your pattern in old-gold, white, and navy, and you
have already figured out what design you are going to make with the tape as
well as how many blocks you will cover with each color. Now you need to
figure out how much this project will cost. Using the total number of
blocks to tape over, the respective fractions (given as a decimal) of
blocks to be a certain color, the number of blocks that one roll of tape
can cover, and the prices of each color of tape given below, this function
should output the total cost of buying all of the tape for this project.
Your function should also take account for an 8% sales tax, which should be
calculated using the subtotal cost. You should then round your final output
to the nearest cent (or hundredths decimal place).

Old Gold       $4.99 
White          $2.99
Navy           $3.99

Notes: ? You are not able to buy partial rolls of tape. ? You should not
actually do this in your residence hall, just a heads up.
%}

% Thank you Sean and Rachael for grading our work. We appreciate it.

%-- 8/20/2015 3:49 PM --%