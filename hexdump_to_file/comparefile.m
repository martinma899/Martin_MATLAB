function comparefile(filename1,filename2,outname1,outname2,comparename,bitoffset)

% filename1, filename2 are file names of the files to be analyzed
% outname1 and outname2 are files to write the hex dump
% comparename is the file to write comparison file
% byteoffset offers functionality to offset bytes to compare. positive
% numbers offset the second file. negative numbers offset the first file.

% run hexdump on both files and get byte data
data1 = hexdump2(filename1,outname1);
data2 = hexdump2(filename2,outname2);

bin1 = dec2bin(data1,8);
bin2 = dec2bin(data2,8);

bin1 = reshape(bin1',[],1);
bin2 = reshape(bin2',[],1);

l1 = numel(bin1);
l2 = numel(bin2);
l2p = l2+bitoffset;
total_length = max(l1,l2p);

% determine comparison mask for all cases
if l1 >= l2p
  end_offset = l1-l2p;
  mid_length = l2;
%   mask1 = (1+bitoffset):l2p;
%   mask2 = 1:l2;
else
  end_offset = l2p-l1;
  mid_length = l1-bitoffset;
%   mask1 = (1+bitoffset):l1;
%   mask2 = 1:lep-end_offset;
end

% construct middle comparison string array

comparison_array = char(49*ones(mid_length,1));
% iterate through all the comparision bits and record results
for i = 1:mid_length
  index1 = i+bitoffset;
  index2 = i; 
  if strcmp(bin1(index1),bin2(index2))
    comparison_array(i) = '1';
  else
    comparison_array(i) = '0';
  end
  
end
% add text array at beginning
if bitoffset > 0
  beginning_array = char('X'*ones(bitoffset,1));
  comparison_array = [beginning_array ; comparison_array];
end

% add text array at end
if end_offset > 0
  end_array = char('X'*ones(end_offset,1));
  comparison_array = [comparison_array ; end_array];
end

comparison_array = comparison_array'; % transpose first
comparison_array = reshape(comparison_array,8,[]); % reshape into 8xn
[~,w] = size(comparison_array); % get number of blocks
comparison_array = [comparison_array;char(' '*ones(1,w))]; % add row of space at bottom

% calculate padding
block_per_line = 16;
nline = ceil(w/block_per_line);
padding_amount = mod(w,block_per_line); % calculate amount of padding
if padding_amount~=0
  padding_array = char(' '*ones(9,padding_amount)); % add padding
  comparison_array = [comparison_array padding_array];
end
comparison_array = reshape(comparison_array,block_per_line*9,[]); % reshape
comparison_array = comparison_array'; % transpose

% make address box
addrbox = sprintf('%08x', 0:16:(16*(nline-1)));
addrbox = reshape(addrbox, 8, nline);
addrbox = addrbox';
vcspaces = repmat(': ', [nline,1]);
output_array = [addrbox vcspaces comparison_array];

% add title
title = '                  0        1        2        3        4        5        6        7        8        9        A        B        C        D        E        F';

% write to file
fido = fopen(comparename,'w');
fprintf(fido,'%s\n',title);
for i = 1:nline
  fprintf(fido,'%s\n',output_array(i,:));
end
fclose(fido);
end