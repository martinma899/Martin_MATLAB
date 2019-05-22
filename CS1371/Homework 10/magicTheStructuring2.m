%%% Read This First %%%

% This code has undergone so many revisions I don't even like to think
% about it. The vestigial parts of code are left in in case some problem
% comes up that I haven't accounted for and I need to reference my prior
% work. Igmore them for all intents and purposes.

% In section 1, The code sorts the structure array based on power, then
% each distinct power grouping is sorted based on toughness.

% In section 2, variables that will be needed later are initialized and the
% names of the two players are saved in a distinct cell array for ease of
% access

% In section 3, the case of player 2 being the attacking player is
% accounted for.

% In section 4, the same is done for player 1 being the attacker

function [Graveyard,damageTaken] = magicTheStructuring(game1,attacker)
%% Section 1, Structure sorting

cardsSort=sortStruct(game1);
% [~,powerSort]=sort([game1.Power]);
% powerSort=powerSort(1:numel(game1)-2)-4;
% cardsSort=game1(powerSort);
% count=0;
% for i = 1:numel(cardsSort)
%     if ~count
%         count=sum([cardsSort.Power]==cardsSort(i).Power);
%         [~,toughnessSort]=sort([cardsSort(i:i+count-1).Toughness]);
%         toughnessSort=toughnessSort(end:-1:1);
%         cardsSort(i:i+count-1)=cardsSort(toughnessSort+i-1);
%         count=count-1;
%     else
%         count=count-1;
%     end
% end

%% Section 2, Housekeeping
names={game1(1:2).Name};
cardsP1=cardsSort(strcmp(names(1),{cardsSort.Owner}));
cardsP2=cardsSort(strcmp(names(2),{cardsSort.Owner}));
numdeadp1=1;
numdeadp2=1;
damagep1=0;
damagep2=0;
exists1=false;
exists2=false;
Graveyard=[];

%% Section 3, Player 2 Attacking
if strcmp(attacker,names{2}) 
    cardsP2=cardsP2(end:-1:1);
%     cardsP2temp=cardsP2;
    for i=1:numel(cardsP2) %initial blocks
        if i <= numel(cardsP1)
%             Attacker = cardsP2(i);
%             Blocker = cardsP1(i);
            if cardsP2(i).Power>=cardsP1(i).Toughness %blocker die
                Graveyard.(names{1})(numdeadp1)=cardsP1(i);
                numdeadp1=numdeadp1+1;
                exists1=true;
%                 cardsP2temp(i).Toughness=cardsP2temp(i).Toughness-cardsP1(i).Power;
%                 cardsP2temp(i).Power=cardsP2temp(i).Power-cardsP1(i).Toughness;
                if cardsP1(i).Power>=cardsP2(i).Toughness %attacker die
                    Graveyard.(names{2})(numdeadp2)=cardsP2(i);
                    numdeadp2=numdeadp2+1;
                    exists2=true;
                end
            elseif cardsP1(i).Power>=cardsP2(i).Toughness %attacker die
                Graveyard.(names{2})(numdeadp2)=cardsP2(i);
                numdeadp2=numdeadp2+1;
                exists2=true;
%                 cardsP2temp(i).Toughness=cardsP2temp(i).Toughness-cardsP1(i).Power;
%                 cardsP2temp(i).Power=cardsP2temp(i).Power-cardsP1(i).Toughness;
                if cardsP2(i).Power>=cardsP1(i).Toughness %blocker die
                    Graveyard.(names{1})(numdeadp1)=cardsP1(i);
                    numdeadp1=numdeadp1+1;
                    exists1=true;
                end
            else
%                 cardsP2temp(i).Toughness=cardsP2temp(i).Toughness-cardsP1(i).Power;
            end
        else
            damagep1 = damagep1 + cardsP2(i).Power;
        end
    end
    damageTaken=damagep1;
% Vestigial Code
%     if numel(cardsP1)>numel(cardsP2)
%         dif=numel(cardsP1)-numel(cardsP2);
%         for i=numel(cardsP2)+1:numel(cardsP1)
%             j=i-dif;
%             if cardsP2temp(j).Power>cardsP1(i).Toughness %blocker die
%                 Graveyard.(names{1})(numdeadp1)=cardsP1(i);
%                 numdeadp1=numdeadp1+1;
%                 cardsP2temp(j).Toughness=cardsP2temp(j).Toughness-cardsP1(i).Power;
%                 cardsP2temp(j).Power=cardsP2temp(j).Power-cardsP1(i).Toughness;
%                 if cardsP1(i).Power>cardsP2temp(j).Toughness %attacker die
%                     Graveyard.(names{2})(numdeadp2)=cardsP2(i);
%                     numdeadp2=numdeadp2+1;
%                 end
%             elseif cardsP1(i).Power>cardsP2temp(j).Toughness %attacker die
%                 Graveyard.(names{2})(numdeadp2)=cardsP2(j);
%                 numdeadp2=numdeadp2+1;
%                 cardsP2temp(i).Toughness=cardsP2temp(j).Toughness-cardsP1(i).Power;
%                 cardsP2temp(i).Power=cardsP2temp(j).Power-cardsP1(i).Toughness;
%                 if cardsP2temp(j).Power>cardsP1(i).Toughness %blocker die
%                     Graveyard.(names{1})(numdeadp1)=cardsP1(i);
%                     numdeadp1=numdeadp1+1;
%                 end
%             end
%             j=j+1;
%         end
%     end

%% Section 4, Player 1 Attacking
else 
    cardsP1=cardsP1(end:-1:1);
%     cardsP1temp=cardsP1;
    for i=1:numel(cardsP1) %initial blocks
        if i <= numel(cardsP2)
%             Attacker = cardsP1(i);
%             Blocker = cardsP2(i);
            if cardsP1(i).Power>=cardsP2(i).Toughness %blocker die
                Graveyard.(names{2})(numdeadp2)=cardsP2(i);
                numdeadp2=numdeadp2+1;
                exists2=true;
%                 cardsP1temp(i).Toughness=cardsP1temp(i).Toughness-cardsP2(i).Power;
%                 cardsP1temp(i).Power=cardsP1temp(i).Power-cardsP2(i).Toughness;
                if cardsP2(i).Power>=cardsP1(i).Toughness %attacker die
                    Graveyard.(names{1})(numdeadp1)=cardsP1(i);
                    numdeadp1=numdeadp1+1;
                    exists1=true;
                end
            elseif cardsP2(i).Power>=cardsP1(i).Toughness %attacker die
                Graveyard.(names{1})(numdeadp1)=cardsP1(i);
                numdeadp1=numdeadp1+1;
                exists1=true;
%                 cardsP1temp(i).Toughness=cardsP1temp(i).Toughness-cardsP2(i).Power;
%                 cardsP1temp(i).Power=cardsP1temp(i).Power-cardsP2(i).Toughness;
                if cardsP1(i).Power>=cardsP2(i).Toughness %blocker die
                    Graveyard.(names{2})(numdeadp2)=cardsP2(i);
                    numdeadp2=numdeadp2+1;
                    exists2=true;
                end
            else
%                 cardsP1temp(i).Toughness=cardsP1temp(i).Toughness-cardsP2(i).Power;
            end
        else
            damagep2 = damagep2 + cardsP1(i).Power;
        end
    end
    damageTaken=damagep2;
% More Vestigial
%     j=1;
%     for i=1:numel(cardsP1)
%         if ismember({cardsP1(j).Name},{Graveyard.(names{1})(:).Name});
%             cardsP1(j)=[];
%         else
%             j=j+1;
%         end
%     end
%     j=1;
%     cardsP2(1:numel(cardsP1))=[];
%     for i=1:numel(cardsP2)
%         if ismember({cardsP2(j).Name},{Graveyard.(names{2})(:).Name});
%             cardsP2(j)=[];
%         else
%             j=j+1;
%         end
%     end
%     if numel(cardsP2)>numel(cardsP1)
%         dif=numel(cardsP2)-numel(cardsP1);
%         for i=numel(cardsP1)+1:numel(cardsP2)
%             j=i-dif-1;
%             if cardsP1temp(j).Power>=cardsP2(i).Toughness %blocker die
%                 Graveyard.(names{2})(numdeadp2)=cardsP2(i);
%                 numdeadp2=numdeadp2+1;
%                 cardsP1temp(j).Toughness=cardsP1temp(j).Toughness-cardsP2(i).Power;
%                 cardsP1temp(j).Power=cardsP1temp(j).Power-cardsP2(i).Toughness;
%                 if cardsP2(i).Power>=cardsP1temp(j).Toughness %attacker die
%                     Graveyard.(names{1})(numdeadp1)=cardsP1(i);
%                     numdeadp1=numdeadp1+1;
%                 end
%             elseif cardsP2(i).Power>=cardsP1temp(j).Toughness %attacker die
%                 Graveyard.(names{1})(numdeadp1)=cardsP1(j);
%                 numdeadp1=numdeadp1+1;
%                 cardsP1temp(i).Toughness=cardsP1temp(j).Toughness-cardsP2(i).Power;
%                 cardsP1temp(i).Power=cardsP1temp(j).Power-cardsP2(i).Toughness;
%                 if cardsP1temp(j).Power>=cardsP2(i).Toughness %blocker die
%                     Graveyard.(names{2})(numdeadp2)=cardsP2(i);
%                     numdeadp2=numdeadp2+1;
%                 end
%             end
%             j=j+1;
%         end
%     end
end
if exists1 || exists2
    Graveyard=orderfields(Graveyard);
    if exists1
        Graveyard.(names{1}) = sortStruct(Graveyard.(names{1}));
    end
    if exists2
        Graveyard.(names{2}) = sortStruct(Graveyard.(names{2}));
    end
end
end

function outstruct = sortStruct(instruct)
[~,powerSort]=sort([instruct.Power]);
if isequal(instruct(1).Power,'N/A')
    powerSort=powerSort(1:numel(instruct)-2)-4;
end
cardsSort=instruct(powerSort);
count=0;
for i = 1:numel(cardsSort)
    if ~logical(count)
        count=sum([cardsSort.Power]==cardsSort(i).Power);
        [~,toughnessSort]=sort([cardsSort(i:i+count-1).Toughness]);
        toughnessSort=toughnessSort(end:-1:1);
        cardsSort(i:i+count-1)=cardsSort(toughnessSort+i-1);
        count=count-1;
    else
        count=count-1;
    end
end
outstruct=cardsSort;
end