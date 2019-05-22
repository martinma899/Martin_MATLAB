function [] = hairParlour(personname,originalcolor,newcolor)

    I = imread(personname);
    switch originalcolor
        case 'Blonde'
            mask = I(:,:,1)>=205&I(:,:,1)<=255&...
                   I(:,:,2)>=180&I(:,:,2)<=230&...
                   I(:,:,3)>=0&I(:,:,3)<=165;
        case 'Brunette'
            mask = I(:,:,1)>=100&I(:,:,1)<=155&...
                   I(:,:,2)>=30&I(:,:,2)<=80&...
                   I(:,:,3)>=15&I(:,:,3)<=60;
        case 'Red'
            mask = I(:,:,1)>=210&I(:,:,1)<=255&...
                   I(:,:,2)>=80&I(:,:,2)<=115&...
                   I(:,:,3)>=25&I(:,:,3)<=30;
    end

    layerr = I(:,:,1);
    layerb = I(:,:,2);
    layerg = I(:,:,3);
    
    switch newcolor
        case 'Blonde'
            layerr(mask) = 255;
            layerb(mask) = 219;
            layerg(mask) = 74;
        case 'Brunette'
            layerr(mask) = 141;
            layerb(mask) = 70;
            layerg(mask) = 50;
        case 'Red'
            layerr(mask) = 212;
            layerb(mask) = 80;
            layerg(mask) = 24;
    end
    
    refined = cat(3,layerr,layerb,layerg);
    
    if strcmp(originalcolor,newcolor)
        final = cat(2,I,I);
    else
        final = cat(2,I,refined);
    end
    
    temp = strtok(personname,'.');
    finalimagename = [temp '_beforeAfter.png'];
    
    imwrite(final,finalimagename);

end