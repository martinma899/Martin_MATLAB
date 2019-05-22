% housekeeping
clc;clear;close all;close('all');

% randomly choose a song
fnameArr = {};
fnameArr{1} = 'Vivaldi - Stabat Mater';
fnameArr{2} = 'Vivaldi - Four Seasons - Winter';
fnameArr{3} = 'Handel - Overture to Messiah';
fnameArr{4} = 'Handel - Sonata in G Major';
fnameArr{5} = 'Handel - Water Music';
fnameArr{6} = 'Telemann - Trumpet Concerto in D';
fnameArr{7} = 'Telemann - Sonata in f minor for Bassoon and basso continuo';
fnameArr{8} = 'Purcell - Funeral Music for Queen Mary';
fnameArr{9} = 'Purcell - Abdelazer Suite - Rondeau';
fnameArr{10} = 'Purcell - When I am Laid in Earth from Dido and Aeneas';

pieceNumber = randi([1 9],1,1);
piecesToChoose = [1 2 3 4 5 6 8 9 10];
pieceName = fnameArr{piecesToChoose(pieceNumber)};
fname = [pieceName '.mp3'];

% open file
[y,fs] = audioread(fname);
sampleSize = length(y);

% pick an interval of 10 seconds
intervalTime = 20; 
intervalInd = intervalTime*fs;

% compute relative display information
timeLength = sampleSize/fs;
timeLengthStr = secsToStringFormat(timeLength);
endInd = sampleSize - intervalInd;
startInd = randi([1 endInd],1,1);
startTime = timeLength*startInd/sampleSize;
endTime = startTime+intervalTime;
startTimeStr = secsToStringFormat(startTime);
endTimeStr = secsToStringFormat(endTime);

% generate audio
ySample = y(startInd:startInd+intervalInd,:);

% play the interval
sound(ySample,fs)
x = input('Input ''again'' to play again, otherwise input answer\n','s');
while strcmp(lower(x),'again')
  sound(ySample,fs);
  x = input('Input ''again'' to play again, otherwise input answer\n','s');
end

if strcmp(x,pieceName)
  fprintf('Correct!\n');
else
  fprintf('Incorrect\n');
end

fprintf('Correct Answer: %s\n',pieceName);
fprintf('   Your Answer: %s\n',x);

fprintf('Piece number: %d\n',pieceNumber);
fprintf('Length: %s\n',timeLengthStr);
fprintf('Played length: %d seconds\n',intervalTime);
fprintf('Played from: %s to %s\n',startTimeStr,endTimeStr);









