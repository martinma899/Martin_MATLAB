function data = hexdump2 (filename,outname)

% filename = file name of file to be analyzed
% outname = file name to write hex dump to
% writeoption = write option to dump file, w or a

fid = fopen(filename,'r'); % open the file
if fid < 3
    error('hexdump:unknownFile', 'Couldn''t open file %s for reading.', filename);
end
data = fread(fid,inf,'uint8=>uint8'); % read data
fclose(fid); % close file

ndata = numel(data); % make address box
nline = ceil(ndata/16); % calculate number of lines
addrbox = sprintf('%08x', 0:16:(16*(nline-1)));
addrbox = reshape(addrbox, 8, nline);
addrbox = addrbox';

% create the center hex box for the hex dump
hexbox = sprintf('%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x %02x', data);

% Pad the center box
paddingAmount = 47 * ceil(numel(hexbox)/47) - numel(hexbox);
hexbox = [hexbox, repmat(' ', [1 paddingAmount])];
hexbox = reshape(hexbox, 47, nline);
hexbox = hexbox';

% create the binary box
binbox = dec2bin(data,8); % convert data to ndata x 8 0/1 array 
binbox = [binbox repmat(' ',[ndata 1])]; % add space to the right
paddingAmount = nline*16-ndata; % calculate amount of padding
binbox = [binbox ; repmat('         ',[paddingAmount 1])]; % add padding to the end
binbox = binbox'; % transpose
binbox = reshape(binbox, 144, nline);
binbox = binbox'; % transpose

% create the character box
% convert the nonprinting data to '.'
nonprinting_mask = data<32 | data==127 | data==129 | data==141 | data==143 | data==144 | data==157;  
data_maskd = data;
data_maskd(nonprinting_mask) = '.';

charbox = sprintf('%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c', data_maskd); % write data to chars

% pad the character box
paddingAmount = 16 * ceil(numel(charbox)/16) - numel(charbox);
charbox = [charbox, repmat(' ', [1 paddingAmount])];
charbox = reshape(charbox, 16, []);
charbox = charbox';

% put things together
vspaces = repmat('  ', [nline,1]);
vcspaces = repmat(': ', [nline,1]);
fullbox = [addrbox vcspaces hexbox vspaces charbox vspaces binbox];

% write result to file
fido = fopen(outname,'w');
title = '           0  1  2  3  4  5  6  7  8  9  A  B  C  D  E  F  0123456789ABCDEF         0        1        2        3        4        5        6        7        8        9        A        B        C        D        E        F';
fprintf(fido,'%s\n',title);
for i = 1:nline
  fprintf(fido,'%s\n',fullbox(i,:));
end
fclose(fido);

end