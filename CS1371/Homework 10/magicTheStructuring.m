function [graveyard,damage] = magicTheStructuring (game,attacker)
%% Process data

    gamearr = onebynstruct2cell(game);
    playerscell = gamearr(1:2,2);
    playerscell = playerscell';
    attackerindex = find(strcmp(playerscell(:),attacker));
    if attackerindex == 2
        defenderindex = 1;
    else
        defenderindex = 2;
    end
    defender = playerscell{defenderindex};
    
    attackingsideindex = strcmp(gamearr(3:end,3)',attacker);
    defendingsideindex = strcmp(gamearr(3:end,3)',defender);
    
    allcreaturenames = gamearr(3:end,2);
    
    attackingcreaturenames = allcreaturenames(attackingsideindex);
    defendingcreaturenames = allcreaturenames(defendingsideindex);
    
    alldata = gamearr(3:end,4:5);
    
    attackdata = cell2mat(alldata(attackingsideindex,:));
    defenddata = cell2mat(alldata(defendingsideindex,:));
    
    attackingcreaturenumber = length(attackingcreaturenames);
    defendingcreaturenumber = length(defendingcreaturenames);


%% Sort data, compare, trim and play

        [sortedattackdata,sortedattackindex] = sortbasedontwocols (attackdata);
        [~,sorteddefendindex] = sortbasedontwocols (defenddata);
        sorteddefenddata = defenddata(sorteddefendindex(end:-1:1),:);
        sorteddefendindex = sorteddefendindex(end:-1:1);
        
        if attackingcreaturenumber < defendingcreaturenumber % more defend
            sorteddefenddata = sorteddefenddata(1:attackingcreaturenumber,:);
            sorteddefendindex = sorteddefendindex(1:attackingcreaturenumber);
            damage = 0;
        elseif  attackingcreaturenumber > defendingcreaturenumber % more attack
            damage = sum(sortedattackdata(defendingcreaturenumber+1:end,1));
            sortedattackdata = sortedattackdata(1:defendingcreaturenumber,:);
            sortedattackindex = sortedattackindex(1:defendingcreaturenumber);
        else
            damage = 0;
        end
        
        % Interaction!!!
        
        attackdataafter = sortedattackdata;
        defenddataafter = sorteddefenddata;
        
        attackdataafter(:,2)=sortedattackdata(:,2)-sorteddefenddata(:,1);
        defenddataafter(:,2)=sorteddefenddata(:,2)-sortedattackdata(:,1);
        
        attackdeadindexraw = attackdataafter(:,2)<=0;
        defenddeadindexraw = defenddataafter(:,2)<=0;
        
        attackdeadindex = find(attackdeadindexraw);
        defenddeadindex = find(defenddeadindexraw);
        
        % Use the after attack array and index to sort dead creatures
        % correctly, prepare for graveyard calc
        
        deadattackcreaturedata = sortedattackdata(attackdeadindex,:);
        deaddefendcreaturedata = sorteddefenddata(defenddeadindex,:);
        
        [~,tempdeadattackindex] = ...
            sortbasedontwocolsbeta(deadattackcreaturedata);
        [~,tempdeaddefendindex] = ...
            sortbasedontwocolsbeta(deaddefendcreaturedata);
        
        finaldefenddeadindex = ...
            sorteddefendindex(defenddeadindex(tempdeaddefendindex));
        finalattackdeadindex = ...
            sortedattackindex(attackdeadindex(tempdeadattackindex));
        
        
%% Calculate graveyard
        
        graveyard = struct(attacker,[],defender,[]);
        graveyard = orderfields(graveyard);
        
        for i = 1:length(finalattackdeadindex)
            attackgraveyard(i).Type = 'Creature';
            attackgraveyard(i).Name = ...
            attackingcreaturenames{finalattackdeadindex(i)};
            attackgraveyard(i).Owner = attacker;
            attackgraveyard(i).Power = ...
            attackdata(finalattackdeadindex(i),1);
            attackgraveyard(i).Toughness = ...
            attackdata(finalattackdeadindex(i),2);
        end
        
        for i = 1:length(finaldefenddeadindex)
            defendgraveyard(i).Type = 'Creature';
            defendgraveyard(i).Name = ...
            defendingcreaturenames{finaldefenddeadindex(i)};
            defendgraveyard(i).Owner = defender;
            defendgraveyard(i).Power = ...
            defenddata(finaldefenddeadindex(i),1);
            defendgraveyard(i).Toughness = ...
            defenddata(finaldefenddeadindex(i),2);
        end
        
        graveyard.(attacker) = attackgraveyard;
        graveyard.(defender) = defendgraveyard;
    
end

function [outarr,index] = sortbasedontwocolsbeta (inarr)
    
    [a,b] = size(inarr);
    
    outarr = zeros(a,b);
    
    for i = 1:a
        temp(i) = inarr(i,1)-inarr(i,2)/1000;
    end
    
    [~,index] = sort(temp,'ascend');
    
    outarr(1:a,1) = inarr(index,1);
    outarr(1:a,2) = inarr(index,2);
    
    index = index';
end

function [outarr,index] = sortbasedontwocols (inarr)
    
    [a,b] = size(inarr);
    
    outarr = zeros(a,b);
    
    for i = 1:a
        temp(i) = inarr(i,1)-inarr(i,2)/1000;
    end
    
    [~,index] = sort(temp,'descend');
    
    outarr(1:a,1) = inarr(index,1);
    outarr(1:a,2) = inarr(index,2);
    
    index = index';
end

function [outcell] = onebynstruct2cell(struct)

    cellraw = struct2cell(struct);
    [a,~,b] = size(cellraw);
    outcell(1:a,1:b) = cellraw(:,1,:);
    outcell = outcell';

end