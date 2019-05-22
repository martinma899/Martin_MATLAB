fid = fopen('happy new year.png.txt','r');
line = fgetl(fid);
arr = [];
while ischar(line)
    arr = [arr;line];
    line = fgetl(fid);
end

clc
disp(arr)