close all

% r = 165; -- color of the cap
% g = 128;
% b = 90;

% r = 0; -- color of the bill
% g = 43;
% b = 84;



xdim = 500;
ydim = 500;

layer1 = ones(xdim,ydim)*r;
layer2 = ones(xdim,ydim)*g;
layer3 = ones(xdim,ydim)*b;

img = uint8(cat(3,layer1,layer2,layer3));

imshow(img)