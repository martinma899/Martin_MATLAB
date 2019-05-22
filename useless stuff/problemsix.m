clc;clear

aarr = 1:5000;
barr = 1:5000;

threshold = 1e-5;

figure(1);
hold on;
for i = 1:numel(aarr)
  for j = 1:numel(barr)
    a = aarr(i);
    b = barr(j);
    
    %plot(a,b,'b.');
    
    if (a<b)
      break;
    end
    
    num = a^2+b^2;
    num2 = num;
    den = a*b+1;
    
    flag = false;
    while true
      if num2==den
        flag = true;
      elseif num2<den
        break;
      end
      num2 = num2-den;
    end

    if flag
    fprintf('%d %d %d \n',a,b,num/den);
    plot(a,b,'rd');
    text(a,b,[' ' num2str(num/den)]);
    end
  end
end