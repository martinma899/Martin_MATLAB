function [img] = replicate (img,times)

    for i = 1:times
        img = [img img;img img];
    end

end