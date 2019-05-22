box on % turn on the box
hold on % turn hold on
view(-30,30); % set view

gt1 = imread('gtlogofinal.jpg'); % read first image to gt1
gt2 = imread('cs.png'); % read second image to gt2
gt3 = imread('matlab.png'); % read third image to gt3

%process second image
[a,b,~] = size(gt1);
addlengt1h = b-a;
addlengt1h1 = round(addlengt1h/2);
addlengt1h2 = addlengt1h-addlengt1h1;
add1 = uint8(255*ones(addlengt1h1,b,3));
add2 = uint8(255*ones(addlengt1h2,b,3));
gt1 = cat(1,add1,gt1,add2);
gt1 = imresize(gt1,[120,120]);
gt1 = gt1(end:-1:1,:,:);
imwrite(gt1,'gt.png');

% plot first image
y1 = -60:60;
z1 = -60:60;
[yy1,zz1] = meshgrid(y1,z1);
xx1 = 60*(1+0*yy1);
gt1 = double(gt1)/255;
surf(xx1,yy1,zz1,gt1,'EdgeColor','none');
axis([-60 60 -60 60 -60 60]);
axis square


% plot second image
x2 = -60:60;
z2 = -60:60;
[xx2,zz2] = meshgrid(x2,z2);
yy2 = 60*(1+0*xx2);
gt2 = double(gt2)/255;
surf(xx2,yy2,zz2,gt2,'EdgeColor','none');
axis([-60 60 -60 60 -60 60]);
axis square

% plot third image
x3 = -60:60;
y3 = -60:60;
[xx3,yy3] = meshgrid(x3,y3);
zz3 = -60*(1+0*xx3);
gt3 = double(gt3)/255;
surf(xx3,yy3,zz3,gt3,'EdgeColor','none');
axis([-60 60 -60 60 -60 60]);
axis square







