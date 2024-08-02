clear;clc

% construct x 
x = linspace(0,1,12);

% construct color array
carr = [(1-x).^2; 2*x.*(1-x); x.^2];

% white out factor
wf = 0.5;

% blend carr with white
white = ones(3,12);
carr = carr*wf+white*(1-wf);

% convert into rgb
carr = round(carr*255);

% convert all to hex format
harr = char();

for i = 1:size(carr,2)
  temp1 = dec2hex(carr(1,i),2);
  temp2 = dec2hex(carr(2,i),2);
  temp3 = dec2hex(carr(3,i),2);
  hexstr = [temp1 temp2 temp3];
  harr = [harr;hexstr];
end

disp(harr)