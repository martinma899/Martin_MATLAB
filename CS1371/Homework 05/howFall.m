function [boo,string] = howFall (array,prediction)

    % This function completes howFall homework. It is very useless otherwise.

    % A very funny way to find the total number of elements in the given
    % array. Lol. I don't wanna hit the key word 'size' so I call the
    % variable sizizy. lol
    sizizy = size(array);
    totalsize = sizizy(1)*sizizy(2);

    % Subtract the prediction and see what happens after the prediction.
    array = array-prediction;
    
    % All the conditions are checked and all the masks are made. After you
    % put the mask into the array, the array becomes linearized into a
    % column vector. To find how many elements, simply use length.
    remain = length(array(array>0));
    green = length(array(array>14));
    yellow = length(array(array>9&array<15));
    orange = length(array(array>3&array<10));
    brown = length(array(array>0&array<4));
    
    % Find whether the prediction is correct.
    boo = (remain/totalsize)<=0.2;
    
    % Print out the description string.
    string = sprintf('There will be %d leaves remaining: %d green, %d yellow, %d orange, and %d brown.'...
        ,remain,green,yellow,orange,brown);
    
end

%{
Function Name: howFall

Inputs: 1. (double) An MxN array of leaves in a tree 2. (double) A
prediction of days left in Fall

Outputs: 1. (logical) A logical value indicating if the prediction was
correct 2. (char) A string describing the leaves still hanging in the tree

Function Description:  The fall semester has begun, and soon the green
leaves at Georgia Tech will turn yellow to orange to brown before finally
falling off their tree. Your friend makes a prediction for the number of
days left in the “Actual Fall” until the leaves have all dwindled away.
Since you are a MATLAB connoisseur now, you decide to write a MATLAB
program that will calculate if your friend’s prediction is correct and will
output a string with the number of green, yellow, orange and brown leaves
still hanging after the prediction time.

Each position in the input array will correspond to a “leaf” in the tree,
and the number will indicate how long until the leaf will fall off of the
tree (this number is guaranteed to be an integer). The color of the leaf is
proportional to this number and can be found according to the given table.

Color Days Before the Leaf Falls Off: Brown 1-3 Orange 4-9 Yellow 10-14
Green 15 and above

After the predicted time has passed, if 20% of the leaves remain, the
prediction was correct and the first output will be true.  If more than 20%
of the leaves are still hanging on the tree, the prediction was incorrect,
and the first output should be false.  Finally, the second output should be
a string listing the number of green, yellow, orange, and brown leaves
remaining, in the following format:  'There will be # leaves remaining: #
green, # yellow, # orange, and # brown.' Where the ‘#’ is replaced with the
actual number of each type of leaf remaining.

For example, given the following array and your friend predicting 5 days
until fall:

tree = [10, 30; 12, 5]

The following array represents the new leaves and the days until they fall
off, once the prediction has been applied:

newTree = [5, 25; 7, 0]

Since 75% of the tree’s leaves are still hanging, your friend’s prediction
is false. Thus, the output string will be the following: 'There will be 3
leaves remaining: 1 green, 0 yellow, 2 orange, and 0 brown.'

Notes: ? The 20% is inclusive, so if 20% of the leaves remain the first
output should be true. ? You may find the sprintf() function helpful.
%}

% Thank you Sean and Rachael for grading our work!

%-- 9/18/2015 11:10 AM --%