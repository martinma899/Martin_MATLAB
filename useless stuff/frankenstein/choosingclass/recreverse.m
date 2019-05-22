
% tiling
% image = uint8(zeros(16,16,3));
% image(:,:,[1 2]) = 255;
% imshow(image)
% 
% use loops to tile images
% 
% yellow = image;
% black = 0*yellow;
% 
% oneunit = [yellow black;black yellow];
% 
% newim = replicate(image,4);
% newim = replicaterec(oneunit,256);
% 
% imshow(newim)
% 
% x = -3:3;
% y = 1:4;
% [xx,yy] = meshgrid(x,y);
% zz = xx.^2+yy.^2;
% 
% figure('Name','mesh plot');
% mesh(xx,yy,zz)
% surf(xx,yy,zz)
% axis square
% plot3(xx,yy,zz,'b--')

% numfacets = 10;
% radius = 1;
% thetarange = linspace(0,2*pi,numfacets);
% phirange = linspace(0,pi,numfacets);
% [theta,phi] = meshgrid(thetarange,phirange);
% x = radius*cos(phi);
% y = radius*sin(phi).*cos(theta);
% z = radius*sin(phi).*sin(theta);
% surf(x,y,z,'EdgeColor','none')
% axis square
% axis off

% view

% r = 5;
% h = 6;
% theta = linspace(0,2*pi,100);
% x = r*cos(theta);
% y = r*sin(theta);
% z = linspace(0,h,100);
% [xx,yy] = meshgrid(x,y);
% zz = meshgrid(z,z);
% surf(xx,yy,zz)
% axis square
% axis equal
% axis off


% exam review
% posterize
% tower = imread('tech_tower.png');
% figure(2)
% mask1 = tower(:,:,1)>128;
% mask2 = tower(:,:,2)>128;
% mask3 = tower(:,:,3)>128;
% layer1 = tower(:,:,1);
% layer2 = tower(:,:,2);
% layer3 = tower(:,:,3);
% layer1(mask1) = 255;
% layer2(mask2) = 255;
% layer3(mask3) = 255;
% tower = cat(3,layer1,layer2,layer3)
% imshow(tower)

function [vecout] = recreverse(vecin)

    if length(vecin) == 1
        vecout = vecin;
    else
        vecout = [vecin(end) recreverse(vecin(1:end-1))];
    end

end
































