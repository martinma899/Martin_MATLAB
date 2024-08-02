function varargout = hexdump(varargin)
%HEXDUMP   Display the hexadecimal values of a binary file.
%
%   DUMP = HEXDUMP(FILENAME) returns a character array containing a
%   representation of a binary file's byte values in hexadecimal notation.
%   Each line contains 16 bytes from the file, with the values grouped into
%   two-byte words.  The address of the first byte of the line and a
%   character representation of the line are also included.
%
%   HEXDUMP(FILENAME) displays a GUI containing the hex dump.
%
%   [...] = HEXDUMP without any input arguments displays a file selection
%   dialog box.

%   Copyright 2004 by Jeff Mather.
%   jeff.mather@mathworks.com

% Use the input argument as the file or open a dialog?
if (nargin == 0)
    
    [filename, pathname] = uigetfile('*.*', 'Pick a file');
    filename = fullfile(pathname, filename);
    
elseif (nargin == 1)
    
    filename = varargin{1};
    
else
    
    error('hexdump:argCount', 'Too many arguments specified.')
    
end

% Open the file.
fid = fopen(filename, 'r');

if (fid < 3)
    
    error('hexdump:unknownFile', 'Couldn''t open file %s for reading.', ...
          filename);
      
end

% Get the fully qualified filename for the titlebar.
titleFilename = fopen(fid);

% Read the data.
data = fread(fid, inf, 'uint8=>uint8');
fclose(fid);

% Create the left "box" for addresses.
numberOfElements = numel(data);
leftBox = sprintf('%08x', 0:16:(16 * floor(numberOfElements/16 - 1)));
leftBox = reshape(leftBox, 8, []);

% Create the center "box" for the hex dump.
centerBox = sprintf('%02x%02x %02x%02x %02x%02x %02x%02x %02x%02x %02x%02x %02x%02x %02x%02x', ...
                    data);

% Pad the center box.
paddingAmount = 39 * ceil(numel(centerBox)/39) - numel(centerBox);
centerBox = [centerBox, repmat(' ', [1 paddingAmount])];
centerBox = reshape(centerBox, 39, []);

% Create the right "box" for the character display.
% - Convert the nonprinting data to '.'
data(data < 32) = '.';
data(data == 127) = '.';
data(data == 129) = '.';
data(data == 141) = '.';
data(data == 143) = '.';
data(data == 144) = '.';
data(data == 157) = '.';

% - Write the data.
rightBox = sprintf('%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c%c', data);

% - Pad the right box data.
paddingAmount = 16 * ceil(numel(rightBox)/16) - numel(rightBox);
rightBox = [rightBox, repmat(' ', [1 paddingAmount])];
rightBox = reshape(rightBox, 16, []);

% Put the different boxes together, creating the hex dump.
numberOfDumpLines = size(leftBox, 2);
fullBox = [leftBox
           repmat([':';' '], [1, numberOfDumpLines])
           centerBox
           repmat([' ';' '], [1, numberOfDumpLines])
           rightBox];

% Transpose the result to make it display correctly.
fullBox = fullBox';

% Display the result.
if (nargout == 1)
    
    varargout{1} = fullBox;
    
else
    
    % Create a GUI to browse the data.
    hFig = hextool;
    set(findobj(hFig, 'tag', 'TitleText'), 'string', titleFilename);
    set(findobj(hFig, 'tag', 'DumpEdit'), 'string', fullBox);
    
end