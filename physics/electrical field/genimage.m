img = reshape(dataarr(:,3),500,500);
%plot (dataarr(:,3));

threashold = 1.5e16;
img(img>=threashold) = threashold;
img = img/threashold;
imshow(img);