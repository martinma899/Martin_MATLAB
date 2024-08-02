function disp_chord(chord)
% functionality: takes in a chord, and displays it in music notation
% inputs:
% chord: a vector of integers representing a chord. 
% by default 0 = C4, rest are in chromatic sequence. 
% best be within range of C0 to C8. 
% offset: an integer indicating the offset system used by the chord's
% numbers. 
% for example, 1 means 1 = C4, 2 = D4, and -1 means -1 = C4, etc. 

empty_col = '                  - - - - -   - - - - -                  ';
full_col  = '- - - - - - - - - - - - - - - - - - - - - - - - - - - - -';
empty_col = empty_col(end:1)';
full_col = full_col(end:1)';

end

