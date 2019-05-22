% housekeeping
clc;clear;close all;fclose('all');

% read music and display information
data = readPartWritingFile('input6.txt')

% check if chords are correct

for i = 1:data.numChords
  fprintf('Checking chord %d: %s chord in %s, \n',i,data.chordNames{i},data.key);
  triad = generateTriad(data.key,data.chordNames{i});
  voices = {'S' 'A' 'T' 'B'};
  for j = 1:4
    thisNoteWithoutNumber = data.chordCellArr{j,i};
    thisNoteWithoutNumber(end) = [];
    thisVoice = voices{j};
    if any(strcmp(triad,thisNoteWithoutNumber))
      fprintf('%s is in chord\n',thisVoice);
    else
      fprintf('%s is not in chord\n',thisVoice);
    end
  end
  fprintf('\n');
end

% check if every part is within their range
BRange = [18 37];
TRange = [25 44];
ARange = [30 49];
SRange = [37 56];

SLine = data.chordNumericalArr(1,:);
ALine = data.chordNumericalArr(2,:);
TLine = data.chordNumericalArr(3,:);
BLine = data.chordNumericalArr(4,:);

SLineLogicalVec = SLine>=SRange(1)&SLine<=SRange(2);
TLineLogicalVec = TLine>=TRange(1)&TLine<=TRange(2);
ALineLogicalVec = ALine>=ARange(1)&ALine<=ARange(2);
BLineLogicalVec = BLine>=BRange(1)&BLine<=BRange(2);

fprintf('Checking vocal range:\n');
if all(SLineLogicalVec)
  fprintf('S part is within range\n');
else
  fprintf('Chord %s for S part is out of range\n',num2str(find(~SLineLogicalVec)));
end
if all(ALineLogicalVec)
  fprintf('A part is within range\n');
else
  fprintf('Chord %s for A part is out of range\n',num2str(find(~ALineLogicalVec)));
end
if all(TLineLogicalVec)
  fprintf('T part is within range\n');
else
  fprintf('Chord %s for T part is out of range\n',num2str(find(~TLineLogicalVec)));
end
if all(BLineLogicalVec)
  fprintf('B part is within range\n');
else
  fprintf('Chord %s for B part is out of range\n',num2str(find(~BLineLogicalVec)));
end

fprintf('\nCheck vocal spacing:\n');
if all((SLine-ALine)<=12)
  fprintf('S and A within one octave\n');
else
  fprintf('S and A over one octave x %d\n',sum(~((SLine-ALine)<=12)));
end
if all((ALine-TLine)<=12)
  fprintf('A and T within one octave\n');
else
  fprintf('A and T over one octave x %d\n',sum(~((ALine-TLine)<=12)));
end


fprintf('\nChecking parallel fifths: \n');

% check parallel fifths between S and A
intervalVec = determineInterval(SLine,ALine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between S and A\n');
else
  fprintf('S and A are good\n');
end
% check parallel fifths between A and T
intervalVec = determineInterval(ALine,TLine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between A and T\n');
else
  fprintf('A and T are good\n');
end

% check parallel fifths between T and B
intervalVec = determineInterval(TLine,BLine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between T and B\n');
else
  fprintf('T and B are good\n');
end

% check parallel fifths between B and S
intervalVec = determineInterval(BLine,SLine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between B and S\n');
else
  fprintf('S and B are good\n');
end

% check parallel fifths between S and T
intervalVec = determineInterval(SLine,TLine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between S and T\n');
else
  fprintf('S and T are good\n');
end

% check parallel fifths between B and A
intervalVec = determineInterval(BLine,ALine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel fifths between B and A\n');
else
  fprintf('B and A are good\n');
end



fprintf('\nChecking parallel octaves: \n');

% check parallel fifths between S and A
intervalVec = determineInterval(SLine,ALine);
isoctave = intervalVec==0;
isParallelOctave = checkConsecutive(isoctave);
if isParallelOctave
  fprintf('There is parallel octave between S and A\n');
else
  fprintf('S and A are good\n');
end
% check parallel fifths between A and T
intervalVec = determineInterval(ALine,TLine);
isfifth = intervalVec==7;
isParallelFifth = checkConsecutive(isfifth);
if isParallelFifth
  fprintf('There is parallel octave between A and T\n');
else
  fprintf('A and T are good\n');
end

% check parallel fifths between T and B
intervalVec = determineInterval(TLine,BLine);
isoctave = intervalVec==0;
isParallelOctave = checkConsecutive(isoctave);
if isParallelOctave
  fprintf('There is parallel octave between T and B\n');
else
  fprintf('T and B are good\n');
end

% check parallel fifths between B and S
intervalVec = determineInterval(BLine,SLine);
isoctave = intervalVec==0;
isParallelOctave = checkConsecutive(isoctave);
if isParallelOctave
  fprintf('There is parallel octave between B and S\n');
else
  fprintf('S and B are good\n');
end

% check parallel fifths between S and T
intervalVec = determineInterval(SLine,TLine);
isoctave = intervalVec==0;
isParallelOctave = checkConsecutive(isoctave);
if isParallelOctave
  fprintf('There is parallel octave between S and T\n');
else
  fprintf('S and T are good\n');
end

% check parallel fifths between B and A
intervalVec = determineInterval(BLine,ALine);
isoctave = intervalVec==0;
isParallelOctave = checkConsecutive(isoctave);
if isParallelOctave
  fprintf('There is parallel octave between B and A\n');
else
  fprintf('B and A are good\n');
end












