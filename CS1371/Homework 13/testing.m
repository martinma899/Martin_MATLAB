a = imread('fox_theater_filtered.png');
b = imread('fox_theater_myans_filtered.png');

c = double(a)-double(b)

ar = rgb_hsl(double(a),'rgb');
br = rgb_hsl(double(b),'rgb');

diff1 = ar(:,:,1)-br(:,:,1);