% housekeeping
clc;clear;close all;close('all');

% randomly choose a song
fnameArr = {};
fnameArr{1} = 'Bach - St Matthew Passion';
fnameArr{2} = 'Mozart - Requiem in d minor';
fnameArr{3} = 'Beethoven - Missa Solemnis';
fnameArr{4} = 'Dvorak - Symphony No. 9 From the New World';
fnameArr{5} = 'Bizet - Carmen';
fnameArr{6} = 'Verdi - Dies Irae from Messa da Requiem';
fnameArr{7} = 'Ives - The Unanswered Question';
fnameArr{8} = 'Prokofiev - Suite from Romeo and Juliet';
fnameArr{9} = 'Bernstein - Overture from Candide';
fnameArr{10} = 'Berio - Coro';

randNum = randi([1 10],1,1);
piecesToChoose = 1:10;
pieceNumber = piecesToChoose(randNum);
pieceName = fnameArr{pieceNumber};
fname = [pieceName '.mp3'];

% open file
[y,fs] = audioread(fname);
sampleSize = length(y);

% pick an interval of 10 seconds
intervalTime = 10; 
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

% Judge and display results
if strcmp(x,pieceName)
  fprintf('Correct!\n');
  answerBool = true;
else
  fprintf('Incorrect\n');
  answerBool = false;
end

fprintf('Correct Answer: %s\n',pieceName);
fprintf('   Your Answer: %s\n',x);

fprintf('Piece number: %d\n',pieceNumber);
fprintf('Length: %s\n',timeLengthStr);
fprintf('Played length: %d seconds\n',intervalTime);
fprintf('Played from: %s to %s\n',startTimeStr,endTimeStr);

% Record performance into text file
performanceFName = 'performance.txt';
[performanceArr] = readPerformanceData(performanceFName);
performanceArr(pieceNumber,2) = performanceArr(pieceNumber,2)+1;
if answerBool
  performanceArr(pieceNumber,1) = performanceArr(pieceNumber,1)+1;
end
writePerformanceData(performanceFName,performanceArr);
displayPerformance(fnameArr,performanceArr);










