function [str] = rPS (p1,p2)

    % This function helps play a very fancy version of rock paper scissors.

    % Use strtok to separate inputs into names and fancy move names.
    [name1,fancymove1] = strtok(p1,'-');
    [name2,fancymove2] = strtok(p2,'-');
    fancymove1 = fancymove1(2:end);
    fancymove2 = fancymove2(2:end);
    
    % Use the helper function to find the name of the actual move, among
    % rock paper or scissors.
    actualmove1 = whatmove(fancymove1);
    actualmove2 = whatmove(fancymove2);

    % Concatenate the names of the two moves so that we can do a case
    % switch statement.
    moves = [actualmove1,' ',actualmove2];
    
    % This is the smart part -- there are only three scinarios. Player one
    % wins, player 2 wins, or tie. Each scinario can occur in three ways in
    % terms of the regular moves. So this is what this switch statement
    % does -- compute the results.
    switch moves
        case {'rocks scissors','paper rocks','scissors paper'}
            str = sprintf ('%s beats %s. %s wins.',fancymove1,fancymove2,name1);
        case {'scissors rocks','rocks paper','paper scissors'}
            str = sprintf ('%s beats %s. %s wins.',fancymove2,fancymove1,name2);
        case {'rocks rocks','scissors scissors','paper paper'}
            str = 'Tie; try again.';
    end         
    
end

function [move] = whatmove(str)

    % This helper function takes in the name of a fancy move and outputs
    % the name of the class of moves in which it belongs. For example,
    % inputting 'Diamond' would get 'rocks'.

    % Create three cells that store strings of different lengths.
    scissors = {'Safety', 'Edge', 'Hair', 'Craft'};
    rocks = {'Sapphire', 'Ruby', 'Quartz', 'Limestone', 'Diamond'};
    paper = {'Cardstock','Origami','Wrapping','Graphing'};

    % Use the powerful ismember built in function to find which cell the
    % input belongs to, therefore determining what basic move it is.
    if ismember(str,scissors)
        move = 'scissors';
    elseif ismember(str,rocks)
        move = 'rocks';
    elseif ismember(str,paper)
        move = 'paper';
    end
    
end

%{
Function Name: rPS

Inputs: 1. (char) Player 1’s name and move (format: 'Name-Move') 2. (char)
Player 2’s name and move (format: 'Name-Move')

Outputs: 1. (char) Sentence containing outcome explanation and winning
player(s)

Function Description: Want to play Rock, Paper, Scissors? No thanks! The
old R-P-S game is so boring and traditional. Instead of plain-old rock, how
about some crystals with personalities, like timeless quartz, or chalky
limestone? You decide to make a new R-P-S game that allows users to add
panache to their moves. Write a MATLAB function that determines which
player wins this new spin on Rock, Paper, Scissors.

The rules are as follows:

All Rock Types Are Equal: Possible Rock Types: 'Sapphire', 'Ruby',
'Quartz', 'Limestone', 'Diamond'. All Scissor Types Are Equal: Possible
Scissor Types: 'Safety', 'Edge', 'Hair', 'Craft'. All Paper Types Are
Equal: Possible Paper Types: 'Cardstock', 'Origami', 'Wrapping',
'Graphing'.

Possible Scenarios When Someone Wins When a Tie Occurs: Paper Type > Rock
Type Rock Type == Rock Type (Tie) Rock Type > Scissor Type Scissor Type ==
Scissor Type (Tie) Scissor Type > Paper Type Paper Type == Paper Type (Tie)
Function Output '<P# move> beats <P~# move>. <P# name> wins.' (where # is
the player with better move) 'Tie; try again.'

Notes: ? All names and moves will be capitalized and separated by a hyphen.

Hints: ? Switch statements may be very useful.
%}

% Thank you Sean and Rachael for grading our work!

% Done on Thursday night.