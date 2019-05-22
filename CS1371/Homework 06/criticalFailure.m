function [out] = criticalFailure (vec)

    % This function decides some outcome of some play of the game Dungens and Dragons, which I neither play nor comprehend.
    
    if vec(1) ~= 1 % If the first roll is not 1
        out = 'Good Job!'; % Then just say good job
    else % If the first roll is 1
        % Then use switch statement to find the correct type of wound
        switch vec(2) 
            case {1,2,3,4,5}
                out = 'Right Leg Wounded';
            case {6,7,8,9,10}
                out = 'Left Leg Wounded';
            case {11,12,13,14,15}
                out = 'Right Arm Wounded';
            case {16,17,18,19,20}  
                out = 'Left Arm Wounded';
        end
    end
    % How fascinating~ wow~ yay~ alright.
end

%{
Function Name: criticalFailure

Inputs: 1.(double) A 1x2 vector of numbers from 1-20, inclusive

Outputs: 1. (char) An output string describing the result of your die roll

Function Description: To the tune of “Mr. Brightside” by The Killers:

I’m coming out of my cage And I’ve been doing just fine Gotta Gotta make
friends because I want them now It started out with Catan—  How did it end
up like this? It was only a game, it was only a game Now I’m casting some
spells And she’s rolling a die While he’s having a snack and she’s failing
her saves Now they’re going to fight And I’m under-leveled  And it’s all in
our heads, but she’s stealing his Loot now He rolls for perception Let me
go I just can’t stop playing D&D It’s taking control

Okay.

Write a MATLAB function to emulate a die roll for an attack in a Dungeons
and Dragons game you are playing. If the first roll (the first number in
the vector) is anything other than a 1, output ‘Good Job!’. If the roll is
a 1, however, you have critically goofed, and a second die will be rolled
(the second number in the vector) to determine what damage you may have
caused to yourself. The table below shows what your output should be for
each roll of the second die:

Die Roll Function Output 1-5 ‘Right Leg Wounded’ 6-10 ‘Left Leg Wounded’
11-15 ‘Right Arm Wounded’ 16-20 ‘Left Arm Wounded’
%}

% Thank you Sean and Rachael for grading our work!

% Comments written on Thursday night.