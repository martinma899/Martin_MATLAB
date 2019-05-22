function [] = snapchat(filename,swipe,thirdparam)

    I = imread(filename);

    swipe = mod(swipe,5);
    
    switch swipe
        case 0
            P = I;
        case 1
            P = 255-I;
        case 2
            for i = 1:3
                P(:,:,i) = sum(I,3)/3;
            end
        case 3
             P = rgb_hsl(double(I)/255,'HSL');
             P(:,:,2) = P(:,:,2)*thirdparam;
             P = uint8(round(255*(rgb_hsl(P,'RGB'))));
        case 4
            [ag,bg,~] = size(thirdparam);
            [ai,bi,~] = size(I);
            aindex = round(linspace(1,ag,ai));
            bindex = round(linspace(1,bg,bi));
            
            thirdparam = thirdparam(aindex,bindex,:);
            
            mask = ~(thirdparam(:,:,1)==0&thirdparam(:,:,2)==255&...
                    thirdparam(:,:,3)==0);
            P = I;
            for i = 1:3
                layerP = P(:,:,i);
                layert = thirdparam(:,:,i);
                layerP(mask) = layert(mask);
                P(:,:,i) = layerP;
            end
    end
    
    savename = [filename(1:end-4) '_filtered.png'];
    P = uint8(P);
    imshow(P);
    imwrite(P,savename);
end