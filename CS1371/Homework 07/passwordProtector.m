function [encrypted] = passwordProtector (in)

    while mean(in)<160
        
        in(in==' ') = [];
        
        in(in=='A') = char(192);
        in(in=='O') = char(212);
        in(in=='e') = char(235);
        in(in=='z') = char(191);
        
        in = bthing(in);
        in = Fthing(in);
        
        in = caesarCipher(in,1);
        
        %disp(mean(in));
        %pause(0.2);
    end
    
    encrypted = in;
    
end
    
function [string] = caesarCipher (encoded , encodingIndex)

    % The function takes a string and only changes upper and lower case letters in the fashion of caesar cipher.

    % Extract and change the upper and lower case letters in two new
    % strings.
    lowerCase = cslo(encoded(encoded>96&encoded<123),encodingIndex);
    upperCase = cshi(encoded(encoded>64&encoded<91),encodingIndex);
    
    % Find the index vector of the extracted lower case and upper case
    % letters in the original string.
    [~,lowerIndex] = find(encoded>96&encoded<123);
    [~,upperIndex] = find(encoded>64&encoded<91);
    
    % Using the index vector and the caesar ciphered strings to change the
    % letters in the original string.
    string = encoded;
    string(lowerIndex) = lowerCase;
    string(upperIndex) = upperCase;

end

function [original] = cslo (encoded , encodingIndex)

    % This function is created to caesar cipher a string with only lower
    % case letters.

    % Turn the string of letters into their encoding index.
    vec = uint16(encoded);

    % Use mod function twice to function as a fully functional Caesar
    % cipher.
    vec = mod(vec-97+mod(encodingIndex,26),26)+97;
    
    % Convert the encoded indexes back to corresponding characters.
    original = char(vec);

end

function [original] = cshi (encoded , encodingIndex)

    % This function is created to caesar cipher a string with only upper
    % case letters.

    % Turn the string of letters into their encoding index.
    vec = uint16(encoded);

    % Use mod function twice to function as a fully functional Caesar
    % cipher.
    vec = mod(vec-65+mod(encodingIndex,26),26)+65;
    
    % Convert the encoded indexes back to corresponding characters.
    original = char(vec);

end

function [out] = bthing (string)

    index = strfind(string,'b');
    indexplus = [strfind(string,'b') length(string)];
    amount = length(index);
    
    if logical(amount)
        out = string(1:index(1));
        for i = 1:amount
            out = [out char(223) string(indexplus(i)+1:indexplus(i+1))];
        end
    else
        out = string;
    end

end

function [out] = Fthing (string)

    index = strfind(string,'F');
    indexplus = [index length(string)+1];
    amount = length(index);
    
    if logical(amount)
    out = string(1:index(1)-1);
    
    for i = 1:amount
        
        out = [out char(176) string(indexplus(i):indexplus(i+1)-1)];
        
    end
    else
        out = string;
    end

end

    %{
    The edits to be made each iteration are:

    ? Delete all spaces

    ? Replace all instances of capital ‘A’ with the ASCII value 192

    ? Replace all instances of capital ‘O’ with the ASCII value 212

    ? Replace all instances of lowercase ‘e’ with ASCII  the value 235

    ? Replace all instances of lowercase ‘z’ with ASCII the value 191

    ? After all instances of lowercase ‘b’, insert the ASCII value 223

    ? Before all instances of capital ‘F’, insert the ASCII value 176

    ? Then, finally, shift all letters by 1 using caesarCipher()
    %}