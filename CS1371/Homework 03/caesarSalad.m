
function [original] = caesarSalad (encoded , encodingIndex)

    % The function works as a Caesar cipher.

    % Turn the string of letters into their encoding index.
    vec = uint16(encoded);
    
    % Use mod function twice to function as a fully functional Caesar
    % cipher.
    vec = mod(vec-97+mod(encodingIndex,26),26)+97;
    
    % Convert the encoded indexes back to corresponding characters.
    original = char(vec);

end

%{

Function Name: caesarSalad Inputs: 1. (char) A 1xN string of a single word.
2. (double) An integer describing the shift, or the “shift number”.

Outputs: 1. (char) The input word encoded using the Caesar cipher.

Caesar Cipher Information:

The Caesar cipher is named after Julius Caesar, who, according to
Suetonius, used it with a shift of three to protect messages of military
significance. It is unknown how effective the Caesar cipher was at the
time, but it is likely to have been reasonably secure because most of
Caesar's enemies would have been illiterate and others would have assumed
that the messages were written in an unknown foreign language.

Caesar ciphers can still be found today in children's toys such as secret
decoder rings. A Caesar shift of thirteen is also performed in the ROT13
algorithm, a simple method often used to obscure text such as joke
punchlines and spoilers online.

In the Caesar cipher, each letter is shifted by the specified amount. For
example, if the shift is 3, then the letter 'a' would be coded as the
letter 'd'.

Function Description: Write a function that takes in a string of a single
word and uses the Caesar cipher with the input shift number to encode it.
Only lower case letters will be included in the input string; any other
characters—such as spaces, periods, commas, etc.—will not be included as
part of the input.

Notes: ? The Caesar cipher should work for both positive and negative
integers that indicate the shift given by the second input. ? There is no
limit to the value of the shift number in the second input.
 
Hints: ? The mod() function will be useful.

%}

% Thank you Rachael and Sean for grading our work!!! 

%-- 9/3/2015 12:30 PM --%