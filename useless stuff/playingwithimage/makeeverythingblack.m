clear;close all
img = imread('math.JPG');
[r,c,~] = size(img);
% mask = mean(double(img),3)<=0;
% mask = cat(3,mask,mask,mask);
% newimg = img;
% newimg(mask) = 0;
% newimg(~mask) = 255;
% imshow(newimg)

numberofplots = 9;
start = 207;
finish = 128;
solution = ([1 1;numberofplots 1]^-1)*[start;finish];

for i = 1:numberofplots
    subplot(3,3,i);
    filterlevel = round(solution(1)*i+solution(2));
    mask = mean(double(img),3)<=filterlevel;
    mask = cat(3,mask,mask,mask);
    newimg = img;
    newimg(mask) = 0;
    newimg(~mask) = 255;
    imshow(newimg);
    title(['filter level:' num2str(filterlevel)]);
end

%%

% do an analysis
% choose a row -- row 30

% testrowind = 30;
% testrow = img(testrowind,:,:);
% x = 1:c;
% r = testrow(:,:,1);
% g = testrow(:,:,2);
% b = testrow(:,:,3);
% avg = (double(r)+double(g)+double(b))/3;
% imtestrowblack = img;
% imtestrowblack(testrowind,:,:) = 0;
% 
% cutofflineshow = 210*ones(1,c);
% 
% subplot(2,1,1);
% imshow(imtestrowblack);
% hold on
% subplot(2,1,2);
% hold on
% % plot(x,r,'r');
% % plot(x,g,'g');
% % plot(x,b,'b');
% plot(x,avg,'k');
% plot(x,cutofflineshow,'k');
% box off
% axis off
% hold off