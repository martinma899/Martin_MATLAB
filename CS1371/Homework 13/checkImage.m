function [str] = checkImage(imname1,imname2)

    img1 = imread(imname1);
    img2 = imread(imname2);
    
    [x1,y1,~] = size(img1);
    [x2,y2,~] = size(img2);
    
    if (x1+y1^2)~=(x2+y2^2)
        str = 'The images have different dimensions.';
    else
        logic = img1==img2;
        if all(all(all(logic)))
            str = 'The images are the same.';
        else
            str = 'The RGB values are different.';
            onelayer = 225*~(~logic(:,:,1)|~logic(:,:,2)|~logic(:,:,3));
            image(:,:,1) = onelayer;
            image(:,:,2) = onelayer;
            image(:,:,3) = onelayer;
            imname1 = strtok(imname1,'.');
            imname2 = strtok(imname2,'.');
            comparisonname  = [imname1 'VS' imname2 '.png'];
            imwrite(image,comparisonname);
        end
    end

end