clc;clear

while true
  str = input('','s');
  total = 0;
  while ~isempty(str)
    digit = str(1);
    if digit=='1'
      if length(str)==1
        total = total+1;
        str(1) = [];
      else
        if str(2)=='0'
          total = total+10;
          str([1,2]) = [];
        else
          total = total+1;
          str(1) = [];
        end
      end
    else
      total = total+str2double(digit);
      str(1) = [];
    end
  end
  disp(total)
end