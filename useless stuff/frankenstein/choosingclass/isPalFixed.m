function result = isPalFixed(word)
    word = lower(word);
    word(~isletter(word)) = [];
    result = isPal(word);
end