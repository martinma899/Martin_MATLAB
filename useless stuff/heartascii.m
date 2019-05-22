clc;clear;

fid = fopen('heartascii.txt','r');
line = fgetl(fid);
cellarr = [];
maxlength = 0;

while ischar(line)
    if numel(line)>maxlength
        maxlength = numel(line);
    end
    cellarr = [cellarr;{line}];
    line = fgetl(fid);
end
chararr = [];
for i = 1:numel(cellarr)
    line = cellarr{i};
    if numel(line)<=maxlength
        line = [line char(32*ones(1,maxlength-numel(line)))];
    end
    chararr = [chararr;line];
end
fclose(fid);
clearvars cellarr
clearvars ans
clearvars fid
clearvars i
clearvars line
clearvars maxlength

clc

% do the animation
freq = 10; % 10 refreshes per sec
time = 10;
maxf = 1;
while true
    for size = [linspace(0,maxf,freq*time/2) linspace(maxf,0,freq*time/2)]
        displayed = asciiResize (chararr,size);
        clc
        disp(displayed);
        pause(1/freq);
    end
end
