function [outcome] = battleRoyal (names,strengths,isface)

    % This function decides which of the three wrestler would win the fight.

    % Create a cell that has three elements, ready to be filled with three
    % name strings.
    name = {'' '' ''};

    % Use strtok twice to fill in the name cell with three names.
    [name{1},remain] = strtok(names,',');
    [name{2},remain] = strtok(remain,',');
    name{3} = remain(2:end);
    
    % There's our primary huge if statement: If this dude is here then he
    % wins for some reason. Obviously the TA who wrote the question is a
    % huge fan of this dude. lol. I would have done the same thing if I
    % were TA.
    if ismember('John Cena',name)
        outcome = 'John Cena wins by absolute domination!!!';
    
    % So other than this scinario, let's dive into nasty calculation.
    else
        
        % Find how many faces there are and store the number of faces in
        % the variable sumy. What a cute name. Somebody name their daughter
        % that. lol. 
        sumy = sum(isface);
        
        % We only need to change strength points in to scinarios -- when
        % there's one face or two faces.
        switch sumy
            case 1
                onlyface = find(isface);
                strengths(onlyface) = strengths(onlyface)-3;
            case 2
                onlyheel = find(~isface);
                strengths(onlyheel) = strengths(onlyheel)-3;
        end
        
        % After changing or not changing strength points, we sort the
        % strength vector and find how anybody would win.
        [sortedstrengths,index] = sort(strengths,'descend');
        
        % The variable championdiff compares the guy with the highest point
        % and second highest point to decide what will happen.
        championdiff = sortedstrengths(1)-sortedstrengths(2);
        
        % If the two top guys are the same, the underdog wins. Like how
        % Bronco and Tombstone tore each other apart in semifinals and the
        % stupid Biteforce just came in and took the champion. Oh well.
        % Oh well. I can't aruge against your luck but just please don't
        % call yourself a bite if you can't even bite anyone at all. If you
        % watched Battlebots you will get me.
        if championdiff==0
            outcome = ['The underdog ' name{index(3)} ' wins!'];
        elseif championdiff==1||championdiff==2
            outcome = [name{index(1)},' just barely takes the victory!'];
        elseif championdiff==3||championdiff==4
            outcome = ['The champion is ',name{index(1)}];
        elseif championdiff>=5
            outcome = [name{index(1)},' wins by a landslide!'];
        end
    end
end


%{
Function Name: battleRoyal

Inputs: 1. (char) A string containing the names of three wrestlers,
separated by commas 2. (double) A 1x3 vector of numbers 0-100 matching the
strengths of each wrestler 3. (logical) A 1x3 logical vector indicating if
each wrestler is a face

Outputs: 1. (char) An output string describing the outcome of the match

Function Description:

Welcome to the exciting world of WWE, where professional wrestlers duke it
out in action-packed fights to determine who will be the next World
Champion. One such fight is the battle royal, in which 20 male wrestlers
enter the ring, but only one leaves victorious. As a professional wrestling
enthusiast, you wish to predict who this winner will be. Since you were
busy doing Drill Problems 1 - 4, you missed the majority of the fight, and
now only 3 wrestlers remain in the ring.

Each of these wrestlers has a unique name given in a comma separated
string, as well as a given score based on his overall strength. This score
is always a whole number between 0 and 100. The higher a wrestler’s score,
the stronger he is in the ring. Lastly, each wrestler can either be
described as a face (good guy) or heel (bad guy). Faces tend to work
together in the ring against heels, and vice versa. You can account for
this behavior by manipulating the wrestlers’ strength scores. If, out of
the remaining 3 contestants, there are 2 faces and only 1 heel, then the
heel’s strength score should decrease by 3 points. On the other hand, if
there are 2 heels against 1 face, the face’s strength should decrease by 3
points. Finally, if the remaining 3 wrestlers are all faces or all heels,
then all of their scores should remain the same.

Given this information, write a function in MATLAB named battleRoyal() that
takes in these three inputs and outputs a string describing the outcome of
the battle royal. The different outcomes are as follows:

o The strongest and second strongest wrestlers have the same strength
scores; they will eliminate each other, and the third strongest wrestler
will win. In this case, the output string should read 'The underdog <name>
wins!' o The difference between the first and second strongest wrestlers is
only 1 or 2; the strongest wrestler will win. In this case, the output
string should read '<name> just barely takes the victory!' o The difference
between the first and second strongest wrestlers is 3 or 4; the strongest
wrestler will win. In this case, the output string should read 'The
champion is <name>!' o The difference is 5 or greater between the strongest
wrestler and either of the others; the strongest wrestler will win. In this
case, the output string should read '<name> wins by a landslide!' Homework
#06: Conditionals Drill Problem #5 o Lastly, if 'John Cena' is one of the
names in the first input, then you should completely ignore the above
guidelines and automatically output 'John Cena wins by absolute
domination!!!'

Where the <name> variable above is replaced by the corresponding wrestler’s
name, taken from the first input.

For an example, given the three inputs: str = 'DM Punk,Triple H-B,McDaniel
Bryan' strengths = [100, 94, 93] faceHeel = [true, true, true] Because all
three of these wrestlers are faces, we don’t have to manipulate their
strengths. We can then conclude that 'DM Punk' is the strongest, beating
out the second strongest ('Triple H-B') by 6 points. Therefore, the output
string would read: 'DM Punk wins by a landslide!'

Notes: ? It is guaranteed that all three wrestlers will never have the same
strength, so you do not have to worry about a tie scenario.

Hints: ? The strtok(), sort(), and sprintf() functions may be useful.
%}

% Thank you Sean and Rachael for grading our work!

% Comments created on Thursday night.