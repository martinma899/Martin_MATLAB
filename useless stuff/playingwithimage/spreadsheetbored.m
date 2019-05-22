% read image
img = imread('cat.jpg');
img = imresize(img,1/12);
% cast into double
img = double(img);
% find average value for grayscale
img = mean(img,3);
% write a loop to duplicate the rows
s = size(img);
img2 = [];
for i = 1:s(1)
    for j = 1:3
        img2 = [img2;img(i,:)];
    end
end
img2 = uint8(img2);
xlswrite('boredwithspreadsheet2.xlsx',img2);