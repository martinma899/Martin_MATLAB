clc;clear;close all

img = ones(50,50,3);
colorArr = [1 0 0];
for i = 1:3
  img(:,:,i) = img(:,:,i)*colorArr(i);
end
imshow(img)

%[1 1 0] is yellow
%[1 1 1] is white
%[0 0 0] is black
%[1 0 1] is magenta
%[0 1 1] is cyan
