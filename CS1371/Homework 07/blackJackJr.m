function [dealt] = blackJackJr (cards)

    howmany = length(cards);
    
    every = 1:howmany;
    
    for i = 1:howmany
        every(i) = sum(cards(1:i));
    end
    
    mask = every>21;
    fails = sum(mask);
    dealt = howmany-fails;

end