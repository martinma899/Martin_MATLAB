fidr = fopen('quote.txt','r');
fidw = fopen('emotionalQuote.txt','wt');

count = 1;
line = fgetl(fidr);
while ischar(line)
    if logical(mod(count,2)) %odd number is 1
        fprintf(fidw,'%s\n',lower(line));
    else
        fprintf(fidw,'%s\n',upper(line));
    end
    count = count+1;
    line = fgetl(fidr);
end

fclose('all')