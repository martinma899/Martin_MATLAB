clc;clear;

% inputs
fname = 'minor7.txt';
chord = [1 5 8 11];
chord_name = 'dominant 7';
start_fret = 5; 
write_to_file = false;
interval_arr = ...
  {'  1' ' b2' '  2' ' b3' '  3' '  4' ' #11' '  5' ' #5' '  6' ' b7' '  7'};

% write header
if write_to_file
  fid = fopen(fname,'w');
else
  fid = 1;
end
fprintf(fid,'Chord Name:        %s\n',chord_name);
fprintf(fid,'Intervals:       ');
for i = chord
  fprintf(fid,'%3s',interval_arr{i});
end
fprintf(fid,'\n');

fprintf(fid,'Chromatic Notes: ');
for i = chord
  fprintf(fid,'%3d',i);
end
fprintf(fid,'\n');

temp = diff([chord 12+chord(1)]);
fprintf(fid,'Adjacent Ints:   ');
for i = temp
  fprintf(fid,'%3d',i);
end
fprintf(fid,'\n\n');


% iterate through all inversions
for inv = 1:numel(chord)
  fprintf(fid,'inv %d\n',inv-1);
  % calculate and write fingerboards
  all_arr = [];
  for bass = 6:-1:4
    fingerboard = generate_chord(bass,chord,chord(inv),interval_arr,start_fret);
    all_arr = [all_arr fingerboard];
    if bass~=4
      all_arr = [all_arr  char(32*ones(7,3))];
    end
  end
  % print all_arr to file
  for i = 1:size(all_arr,1)
    fprintf(fid,'%s\n',all_arr(i,:));
  end
end
