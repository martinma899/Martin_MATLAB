function [description] = rhymeTarragon(filename)
    
    lines = linecount(filename);
    
    if lines > 14
        description = 'The file does not contain a poem.';
    else
    
    fid = fopen(filename,'r');
    
    for i = 1:lines
        rhymeid(i) = getrhymeid(fgetl(fid));
    end
    
    fclose('all');
    
    uniqueids = unique(rhymeid,'stable');
    
    howmany = length(uniqueids);
    
    for i = 1:howmany
        templogic = rhymeid==uniqueids(i);
        rhymeid(templogic) = char(i+64);
    end
    
    rhymeid = char(rhymeid);
    
    rhymes = {'ABCB' 'AABBA' 'ABBAABBACDECDE' 'ABABCDCDEFEFGG'};
     
    switch rhymeid
        case rhymes{1}
            description = strformat('Ghazal',rhymeid,false);
        case rhymes{2}
            description = strformat('Limerick',rhymeid,false);
        case rhymes{3}
            description = strformat('Petrarchan Sonnet',rhymeid,false);
        case rhymes{4}
            description = strformat('Shakespearean Sonnet',rhymid,false);
        otherwise
            description = otherwiise(rhymeid);  
    end
    
    end
end

function [n] = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end

function [rhymeid] = getrhymeid (string)

    string = lower(string);

    words = length(find(string==' '))+1;
    
    string = string(isletter(string));
    
    last3 = string(end-2:end);
    
    rhymestrid = [words last3];
    
    rhymeid = sum(rhymestrid.^(1:4));
    
end

function [outstr] = strformat (type,scheme,isan)

    if isan
        outstr = sprintf('The file contains an %s with an ''%s'' rhyme scheme.',type,scheme);
    else
        outstr = sprintf('The file contains an %s with a ''%s'' rhyme scheme.',type,scheme);
    end

end

function [outstr] = otherwiise (in)

    leng = length(in);
    is4mod = ~logical(mod(leng,4));

    if is4mod
        howmanytimes = leng/4;
        [abab,abba,aaba] = makerefstrs(howmanytimes);
        switch in
            case abab
                outstr = strformat('Alternating Rhyme',in,true);
            case abba
                outstr = strformat('Enclosed Rhyme',in,true);
            case aaba
                outstr = strformat('Ruba''i',in,false);
            otherwise
                outstr = 'The file does not contain a poem.';
        end
    else
        outstr = 'The file does not contain a poem.';
    end

end

function [outstr1,outstr2,outstr3] = makerefstrs (howmanytimes)

    outstr1 = zeros(1,howmanytimes*4);
    outstr2 = zeros(1,howmanytimes*4);
    outstr3 = zeros(1,howmanytimes*4);
    
    addhowmuch = zeros(howmanytimes,4);
    
    for i = 1:4
        addhowmuch(1:end,i) = 0:2:(howmanytimes-1)*2;
    end
    
    for i = 1:howmanytimes
        outstr1(4*i-3:4*i)='ABAB'+addhowmuch(i,:);
    end
    for i = 1:howmanytimes
        outstr2(4*i-3:4*i)='ABBA'+addhowmuch(i,:);
    end
    for i = 1:howmanytimes
        outstr3(4*i-3:4*i)='AABA'+addhowmuch(i,:);
    end

    outstr1 = char(outstr1);
    outstr2 = char(outstr2);
    outstr3 = char(outstr3);
    
end

%{

Output formats:

The file contains a <type> with an '<rhyme scheme>' rhyme scheme.

The file contains an <type> with an '<rhyme scheme>' rhyme scheme.

'ABAB' , etc. Alternating Rhyme 'ABBA' , etc. Enclosed Rhyme 'ABCB' Ghazal 'AABBA' Limerick 'AABA' , etc. Ruba’i 'ABBAABBACDECDE' Petrarchan Sonnet 'ABABCDCDEFEFGG' Shakespearean Sonnet 

%}


