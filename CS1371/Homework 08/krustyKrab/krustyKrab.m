function [total] = krustyKrab (openfilename)

    writefilename = strtok(openfilename,'.');
    
    writefilename = [writefilename '_receipt.txt'];

    lines = linecount(openfilename);
    
    frid = fopen(openfilename,'r');
    fwid = fopen(writefilename,'wt');
    
    header = fgetl(frid);
    fprintf(fwid,'%s\n',header);
        
    if lines~=1
        for i = 1:lines-1
            singlelines(i,:) = fgetl(frid);
            fprintf(fwid,'%s\n',singlelines(i,:));
            [~,tempvar(i,:)] = strtok(singlelines(i,:),'$');
        end

        nums = str2num(tempvar(:,2:end));
        subtotal = sum(nums);
        total = round(1.15*subtotal,2);
    
        fprintf(fwid,'Subtotal=$%0.2f\n',subtotal);
        fprintf(fwid,'Total=$%0.2f\n',total);
    else
        total = 0;
        fprintf(fwid,'Subtotal=$0.00\n');
        fprintf(fwid,'Total=$0.00\n');
    end
    
    fprintf(fwid,'The Krusty Krab, Come spend your money here!');
    
    fclose('all');
        
end

function n = linecount(filename)
    fid = fopen(filename,'r');
    n = 0;
    tline = fgetl(fid);
    while ischar(tline)
        tline = fgetl(fid);
        n = n+1;
    end
    fclose(fid);
end