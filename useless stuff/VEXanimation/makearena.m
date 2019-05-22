onebs = 120;
w = 255*ones(onebs,onebs,3);
r = w;
r(:,:,2:3) = round(255/2);
r(:,:,1) = round(255);
b = w;
b(:,:,1:2) = round(255/2);
b(:,:,3) = round(255);
g = w*0.7;
for i = 1:onebs
    for j = 1:onebs
        if i==1||i==onebs||j==1||j==onebs
            w(i,j,:) = 255;
            r(i,j,:) = 255;
            b(i,j,:) = 255;
            g(i,j,:) = 255;
        end
    end
end

arena = [g g g g g g;
         g g g g g g;
         g g g g g g;
         g g g g g g;
         r g g g g b;
         g r g g b g;];
arena = uint8(arena);
imshow(arena)
%imwrite(arena,'arena.png');