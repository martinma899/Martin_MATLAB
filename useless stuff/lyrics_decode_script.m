clear
fid = fopen('lyrics decode.txt','r');
asciivalue = [];
line = fgetl(fid);
while ischar(line)
    asciivalue = [asciivalue;{double(line)}];
    line = fgetl(fid);
end
fclose(fid);