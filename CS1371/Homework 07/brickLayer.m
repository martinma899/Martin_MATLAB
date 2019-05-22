function [wall] = brickLayer (a,b,color)

    wordsize = length(color);
    coloredbrick = [' [' color '] '];
    blankbrick = [' [' char(ones(1,wordsize)*45) '] '];
    
    bricksize = wordsize+4;
    walllength = bricksize*b;
    wallheight = a;
    
    wall = ones(wallheight,walllength);
    
    logicalindex1 = logical(mod(1:walllength,2));
    logicalindex2 = ~logicalindex1;
    logicalindex3 = logical(mod(1:a,2));
    
    line1 = ones(1,walllength);
    line2 = ones(1,walllength);
    
    for i = 1:b
        wordbegin = (i-1)*bricksize+1;
        wordend = wordbegin+bricksize-1;
        if logicalindex1(i)
            line1(wordbegin:wordend)=coloredbrick;
        else
            line1(wordbegin:wordend)=blankbrick;
        end
    end
    
    for i = 1:b
        wordbegin = (i-1)*bricksize+1;
        wordend = wordbegin+bricksize-1;
        if logicalindex2(i)
            line2(wordbegin:wordend)=coloredbrick;
        else
            line2(wordbegin:wordend)=blankbrick;
        end
    end
    
    for i = 1:a
        if logicalindex3(i)
            wall(i,:) = line1;
        else
            wall(i,:) = line2;
        end
    end

    wall = char(wall);
end