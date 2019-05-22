function [outcome,monsters,log] = cyberChase(game)

    log = false;

    level = game.Level;
    monsters = game.Monsters;
    items = {game.Item};

    while level<=8
        game = game.Next;
        
        level = game.Level;
        monsters = monsters+game.Monsters;
        items = [items;{game.Item}];
        if ~game.ScoobySnax
            outcome = ['You reached level: ' num2str(level)];
            return;
        end
    end
    
    game = game.Next;
    level = game.Level;
    outcome = ['You reached level: ' num2str(level)];
    monsters = monsters+game.Monsters;
    items = [items;{game.Item}];   
    
    gansters = game.Gang;
    
    peoplethere = any(strcmp(gansters,'Scooby'))&&...
    any(strcmp(gansters,'Cyber Scooby'));
    itemthere = any(strcmp(items,'Magnet'));
    
    log = peoplethere&&itemthere;

end