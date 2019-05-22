amplitude = 1;
overalllength = 1000;
zerolength = 50;
datalength = overalllength-zerolength;

zerosinfront = zeros(1,zerolength);
usefuldatadiff = rand(1,datalength)*amplitude;

simulatedranddata = [zerosinfront cumsum(usefuldatadiff)];


% now we put in noise zeros

randerrorindex = unique(randi([zerolength,overalllength],1,10));
simulatedranddata(randerrorindex) = 0;

plot(simulatedranddata);
