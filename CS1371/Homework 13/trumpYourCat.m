function [] = trumpYourCat (catname,toupeename)

    cat = imread(catname);
    toupee = imread(toupeename);
    
    mask = ~(toupee(:,:,1)<=150&toupee(:,:,2)>=180&toupee(:,:,3)<=120);
    
    for i = 1:3
        layert = toupee(:,:,i);
        layerc = cat(:,:,i);
        layerc(mask) = layert(mask);
        cat(:,:,i) = layerc;
    end
    
    outname = ['trumped_' catname];
    
    imwrite(cat,outname);

end