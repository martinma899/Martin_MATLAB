clc;clear;fclose('all');close all

% read in data
[~,~,data] = xlsread('ALL_LTE.xlsx');
lat = cell2mat(data(2:end,18))';
lon = cell2mat(data(2:end,19))';

% plot all accident locations

gcf = figure('name','geographical plot'); % create canvas object
gcf.Units = 'inches'; % set overall canvas unit to in
gcf.Position = [0, 5, 2.25 1.25]; % set canvas size (roughly printed out size on paper, 2.25x1.25 in)
gcf.Color = [1 1 1]; % background color is white

% plot and format mainland US
gx = geoaxes();
gobj = geoscatter(gx,lat,lon,'r.');
gobj.SizeData = 10;
geolimits(gx,[24 50],[-130 -65])
gx.Basemap = 'landcover';
gx.LatitudeLabel.String = [];
gx.LongitudeLabel.String = [];
gx.Scalebar.Visible = 'off';
gx.FontSize = 4;

% plot and format Alaska
gx2 = geoaxes();
gobj2 = geoscatter(gx2,lat,lon,'r.');
gobj2.SizeData = 10;
geolimits(gx2,[53 73],[-190 -120])
gx2.InnerPosition = [0.15 0.15 0.15 0.2];
gx2.Basemap = 'landcover';
gx2.LatitudeLabel.String = [];
gx2.LongitudeLabel.String = [];
gx2.Scalebar.Visible = 'off';
gx2.LatitudeAxis.Visible = 'off';
gx2.LongitudeAxis.Visible = 'off';

% plot and format Hawaii
gx3 = geoaxes();
gobj3 = geoscatter(gx3,lat,lon,'r.');
gobj3.SizeData = 10;
geolimits(gx3,[17 25],[-164 -152])
gx3.InnerPosition = [0.3 0.15 0.1 0.1];
gx3.Basemap = 'landcover';
gx3.LatitudeLabel.String = [];
gx3.LongitudeLabel.String = [];
gx3.Scalebar.Visible = 'off';
gx3.LatitudeAxis.Visible = 'off';
gx3.LongitudeAxis.Visible = 'off';

% export 300 dpi resolution image (best to use this in document)
exportgraphics(gcf,'geo_export_300.png','Resolution',300) 
% export 1000 dpi resolution image (a large image for the fun of it)
exportgraphics(gcf,'geo_export_1000.png','Resolution',1000)
