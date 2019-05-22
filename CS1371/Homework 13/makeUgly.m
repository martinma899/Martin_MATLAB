function [] = makeUgly (imgname)

    img = imread(imgname);
    outname = ['ugly_' imgname];
    
    layer1 = img(:,:,1);
    layer2 = img(:,:,2);
    layer3 = img(:,:,3);
    
    mask = layer1==0&layer2==0&layer3==0;
    
    layer1(mask) = 0;
    layer2(mask) = 255;
    layer3(mask) = 0;
    
    bandwlayer = (layer1+layer2+layer3)/3;
    
    img = cat(3,bandwlayer,bandwlayer,bandwlayer);
    
    [a,b,~] = size(img);
    
    tophalf = img(1:a/2,:,:);
    lowerhalf = img(a/2+1:end,:,:);
    
    stretchindex = round(linspace(1,a/2,a));
    
    tophalf = tophalf(stretchindex,:,:);
    
    img = [tophalf;lowerhalf];
    
    imshow(img)

end